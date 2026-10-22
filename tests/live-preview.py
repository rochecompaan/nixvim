"""Exercise real preview servers via `nix build .#checks.x86_64-linux.live-preview`."""

import json
import os
from pathlib import Path
import select
import socket
import subprocess
import tempfile
import unittest
from urllib.parse import urlsplit
from urllib.request import Request, urlopen


NVIM = os.environ.get("NVIM_BIN", "nvim")


class Session:
    def __init__(self, root):
        root.mkdir()
        self.socket = str(root / "nvim.sock")
        self.log = tempfile.TemporaryFile(mode="w+")
        env = os.environ.copy()
        for name, directory in {
            "HOME": "home",
            "XDG_CONFIG_HOME": "config",
            "XDG_CACHE_HOME": "cache",
            "XDG_DATA_HOME": "data",
            "XDG_STATE_HOME": "state",
            "XDG_RUNTIME_DIR": "runtime",
        }.items():
            path = root / directory
            path.mkdir(mode=0o700)
            env[name] = str(path)
        self.process = subprocess.Popen(
            [NVIM, "--headless", "--listen", self.socket, "-n", "-i", "NONE",
             "-c", "lua io.stdout:write('READY\\n'); io.stdout:flush()"],
            cwd=root, env=env, stdout=subprocess.PIPE, stderr=self.log, text=True,
        )
        ready, _, _ = select.select([self.process.stdout], [], [], 30)
        if not ready or self.process.stdout.readline().strip() != "READY":
            self.close()
            raise RuntimeError("Neovim did not finish startup")
        # Only replace the external browser launch, not preview or HTTP behavior.
        self.evaluate("(function() require('livepreview.utils').open_browser = "
                      "function(url) _G.preview_url = url end; return true end)()")

    def evaluate(self, expression):
        result = subprocess.run(
            [NVIM, "--server", self.socket, "--remote-expr",
             "luaeval(" + json.dumps("vim.json.encode(" + expression + ")") + ")"],
            capture_output=True, text=True, timeout=15,
        )
        if result.returncode:
            raise RuntimeError(result.stderr)
        return json.loads(result.stdout)

    def preview(self, path):
        return self.evaluate(
            "(function() vim.cmd.edit({args = {" + json.dumps(str(path)) + "}}); "
            "vim.cmd('LivePreview start'); return _G.preview_url end)()"
        )

    def stop(self):
        self.evaluate("(function() local s = require('livepreview').serverObj; "
                      "vim.cmd('LivePreview close'); "
                      "assert(vim.wait(2000, function() return s.server == nil end)); "
                      "return true end)()")

    def close(self):
        if self.process.poll() is None:
            self.process.terminate()
        try:
            self.process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            self.process.kill()
            self.process.wait()
        self.process.stdout.close()
        self.log.close()


class PreviewTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="preview-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def session(self, name):
        session = Session(self.root / name)
        self.addCleanup(session.close)
        return session

    def document(self, directory, content):
        path = self.root / directory / "AGENTS.md"
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)
        return path

    def assert_preview(self, url, content):
        self.assertEqual(urlsplit(url).hostname, "127.0.0.1")
        request = Request(url, headers={"Accept": "text/html"})
        with urlopen(request, timeout=5) as response:
            self.assertEqual(response.status, 200)
            self.assertIn(content, response.read().decode())

    def test_concurrent_sessions_serve_their_own_documents(self):
        first = self.session("first")
        second = self.session("second")
        first_url = first.preview(self.document("first docs", "first-session-only"))
        second_url = second.preview(self.document("second docs", "second-session-only"))
        self.assertNotEqual(urlsplit(first_url).port, urlsplit(second_url).port)
        self.assert_preview(first_url, "first-session-only")
        self.assert_preview(second_url, "second-session-only")

    def test_restart_chooses_a_free_port_even_if_previous_port_is_taken(self):
        session = self.session("restart")
        first_url = session.preview(self.document("before", "before-restart"))
        self.assert_preview(first_url, "before-restart")
        session.stop()
        with socket.socket() as occupied:
            occupied.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            occupied.bind(("127.0.0.1", urlsplit(first_url).port))
            occupied.listen()
            next_url = session.preview(self.document("after", "after-restart"))
            self.assertNotEqual(urlsplit(first_url).port, urlsplit(next_url).port)
            self.assert_preview(next_url, "after-restart")


if __name__ == "__main__":
    unittest.main(verbosity=2)
