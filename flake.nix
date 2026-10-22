{
  description = "Roché's NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , nixvim
    , flake-parts
    , pre-commit-hooks
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { system
        , pkgs
        , self'
        , lib
        , ...
        }:
        let
          nixvim' = nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = ./config;
          };
        in
        {
          checks = {
            live-preview =
              let
                previewNvim = nixvim'.makeNixvimWithModule {
                  inherit pkgs;
                  module = ./config/plug/utils/live-preview.nix;
                };
              in
              pkgs.runCommand "live-preview-regression"
                {
                  nativeBuildInputs = [ pkgs.python3 ];
                  NVIM_BIN = "${previewNvim}/bin/nvim";
                } ''
                python3 ${./tests/live-preview.py}
                touch "$out"
              '';

            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                statix.enable = true;
                nixpkgs-fmt.enable = true;
              };
            };
          };

          formatter = pkgs.nixpkgs-fmt;

          packages.default = nvim;

          devShells = {
            default = with pkgs;
              mkShell { inherit (self'.checks.pre-commit-check) shellHook; };
          };
        };
    };
}
