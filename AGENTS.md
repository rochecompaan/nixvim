# Nixvim Configuration Project

This project contains a Neovim configuration managed by [nixvim](https://github.com/nix-community/nixvim), a Neovim distribution built using the Nix package manager. It provides a declarative way to configure Neovim using Nix expressions.

## Project Overview

*   **Purpose**: This is a personal Neovim configuration aiming for a feature-rich, modern editing experience using Nix for reproducibility.
*   **Core Technology**: Nix (Flakes), nixvim, Neovim.
*   **Architecture**: The configuration is structured using Nix modules, primarily within the `config/` directory. Key aspects like general settings (`sets.nix`), keybindings (`keys.nix`), plugin configurations (`config/plug/`), and colorschemes (`config/plug/colorscheme/`, `config/colors/`) are modularized. The main `flake.nix` defines the Nix build environment and packages the final Neovim derivation.

## Building and Running

To build and run this Neovim configuration:

1.  **Prerequisites**: Ensure you have the Nix package manager installed with Flakes enabled.
2.  **Run Directly**: Use `nix run .` in the project root to launch Neovim with this configuration.
3.  **Install System-wide/Home**: Follow the instructions in the main `README.md` to integrate this configuration into your NixOS or home-manager setup. This typically involves adding this repository as a flake input and referencing the `packages.${system}.default` output.

*Note: Specific build commands for the flake itself (beyond `nix run`) are handled by the Nix flake system. The core command to build the package is `nix build .#default`.*

## Development Conventions

*   **Modularity**: Configuration is split into numerous `.nix` files under `config/`. Each file typically configures a specific aspect or plugin.
*   **Plugin Management**: Plugins are enabled and configured declaratively within their respective Nix modules in `config/plug/`.
*   **Colorschemes**: Multiple colorschemes are defined in `config/plug/colorscheme/colorscheme.nix`, with the active one selectable via the `theme` option in `config/default.nix`. The currently active theme is "gruvbox".
*   **Keybindings**: Centralized in `config/keys.nix`. Leader key is set to Space (` `).
*   **Options**: Custom options like `theme` and `assistant` are defined in `config/default.nix` to allow easy customization.

## Key Configuration Files

*   `flake.nix`: Defines the Nix flake, inputs (nixpkgs, nixvim), and the output package.
*   `config/default.nix`: Main configuration entry point, imports all modules, and defines top-level options.
*   `config/keys.nix`: All custom key mappings.
*   `config/sets.nix`: Core Neovim options (`number`, `tabstop`, etc.).
*   `config/plug/colorscheme/colorscheme.nix`: Configures available and active colorschemes.
*   `config/plug/completion/cmp.nix`: Configures the `nvim-cmp` completion engine.
*   `config/plug/lsp/lsp.nix`: Configures LSP servers and keybindings.
*   `config/plug/ui/telescope.nix`: Configures the Telescope fuzzy finder and its keybindings.