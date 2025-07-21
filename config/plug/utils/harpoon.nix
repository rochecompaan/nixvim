{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };

  keymaps = [
    { mode = "n"; key = "<C-a>"; action.__raw = "function() require'harpoon':list():add() end"; }
    { mode = "n"; key = "<leader><CR>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
    { mode = "n"; key = "<C-1>"; action.__raw = "function()require'harpoon':list():select(1) end"; }
    { mode = "n"; key = "<C-2>"; action.__raw = "function()require'harpoon':list():select(2) end"; }
    { mode = "n"; key = "<C-3>"; action.__raw = "function()require'harpoon':list():select(3) end"; }
    { mode = "n"; key = "<C-4>"; action.__raw = "function()require'harpoon':list():select(4) end"; }
  ];
}
