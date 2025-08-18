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
          key: (flow_node) @key-name
          value: (block_sequence
            (block_sequence_item (flow_node) @cmd-val)
            (block_sequence_item (flow_node) @arg-val)
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
