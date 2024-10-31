{
  autoGroups = {
    float_diagnostic = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = ["BufWritePost"];
      callback.__raw = ''
        function()
          require("lint").try_lint()
        end
      '';
    }
    {
      event = ["FocusLost" "ModeChanged" "TextChanged" "BufEnter"];
      pattern = "*";
      command = "silent! update";
      desc = "autosave";
    }
    {
      group = "float_diagnostic";
      event = ["CursorHold"];
      callback.__raw = ''
        function()
        	vim.diagnostic.open_float(nil, { focus = false })
        end
      '';
    }
  ];
}
