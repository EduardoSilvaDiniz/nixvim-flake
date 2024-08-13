{
  plugins.cmp = {
    enable = true;

    settings = {
      #configs -> nvim/plugins/cmp.lua
    };
    extraConfigLua = ''
      require('cmp').setup({})
    '';
  };
}

