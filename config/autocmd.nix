[
  {
    callback = ''
      function()
        require("lint").try_lint()
      end,
    '';
    event = [
      "BufWritePost"
    ];
  }
  {
    event = ["FocusLost" "ModeChanged" "TextChanged" "BufEnter"];
    desc = "autosave";
    pattern = ["*"];
    command = ''
      silent! update
    '';
  }
  {
    event = ["CursorHold"];
    group = ''
      vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
    '';
    callback = ''
      function()
      	vim.diagnostic.open_float(nil, { focus = false })
      end,
    '';
  }
]
# vim.o.updatetime = 250
