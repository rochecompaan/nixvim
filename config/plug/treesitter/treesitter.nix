{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      indent.enabled = true;
    };
  };

  extraFiles = {
    "/queries/yaml/injections.scm" = {
      text = ''
        (block_mapping_pair
          key: (plain_scalar) @key-name
          value: (block_sequence
            (block_sequence_item (plain_scalar) @cmd-val)
            (block_sequence_item (plain_scalar) @arg-val)
            (block_sequence_item (block_scalar) @injection.content)
          )
          (#eq? @key-name "command")
          (#any-of? @cmd-val "/bin/sh" "/bin/bash" "sh")
          (#eq? @arg-val "-c")
          (#set! injection.language "bash")
          (#set! injection.include-children))
      '';
    };
  };
}
