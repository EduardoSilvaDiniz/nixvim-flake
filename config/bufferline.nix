{
  lib,
  pkgs,
  ...
}: let
  lombokPath = lib.getExe pkgs.lombok;
  javaPath = lib.getExe pkgs.jdt-language-server;
in {
  plugins = {
    lspkind = {
      enable = true;
      cmp.enable = true;
    };
    oil.enable = true;
    web-devicons.enable = true;
    clangd-extensions.enable = true;
    comment.enable = true;
    dap.enable = true;
    dashboard.enable = true;
    fidget.enable = true;
    conform-nvim.enable = true;
    lint.enable = true;
    gitsigns.enable = true;
    harpoon.enable = true;
    indent-blankline.enable = true;
    lazygit.enable = true;
    illuminate.enable = true;
    project-nvim = {
      enable = true;
      enableTelescope = true;
    };
    mini = {
      enable = true;
      modules = {
        surround = {};
        comment = {};
        jump = {};
        jump2d = {};
      };
    };
    neogit.enable = true;
    neorg.enable = true;
    navic.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    which-key.enable = true;
    friendly-snippets.enable = true;
    nvim-autopairs.enable = true;
    rainbow-delimiters.enable = true;
    treesitter-context.enable = true;


    lsp = {
      enable = true;
      servers = {
        jdtls.enable = true;
        dartls.enable = true;
        clangd.enable = true;
        nil_ls.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
      };
    };

    nvim-jdtls = {
      enable = true;
      cmd = [
        "${javaPath}"
        "--jvm-arg=-javaagent: ${lombokPath}"
        "-data"
        "~/Projetos/"
      ];
    };

    # betterTerm.enable = true;
    # flutter-tools.enable = true;
    # heirline.enable = true;
    # lspconfig.enable = true;
    # neovim-project.enable = true;
    # nvim-jdtls.enable = true;
    # substitute.enable = true;
    # telescope-file-browser.enable = true;
  };
  colorschemes.catppuccin.enable = true;
}
