{ pkgs, ... }: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "starlark.vim";
      version = "master";
      src = pkgs.fetchFromGitHub {
        owner = "cappyzawa";
        repo = "starlark.vim";
        rev = "master";
        hash = "sha256-TRJ7igED1TqFdDDoIzXE4xSYWvmXkLJENbQDupl0EIE=";
      };
    })
  ];
}
