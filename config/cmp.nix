{
  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [
        { }
      ];
    };
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-f>" = ''
            cmp.mapping(function(fallback)
            	if require("luasnip").jumpable(1) then
            		require("luasnip").jump(1)
            	else
            		fallback()
            	end
            end, { "i", "s" })
          '';
          "<C-b>" = ''
            	cmp.mapping(function(fallback)
            		if require("luasnip").jumpable(-1) then
            			require("luasnip").jump(-1)
            		else
            			fallback()
            		end
            	end, { "i", "s" })
          '';
          "<Tab>" = ''
            cmp.mapping(function(fallback)
            	local col = vim.fn.col(".") - 1
            	if cmp.visible() then
            			cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            		elseif require("luasnip").expand_or_jumpable() then
            			require("luasnip").expand_or_jump()
            		elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            			fallback()
            		else
            			cmp.complete()
            	end
            end, { "i", "s" })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
            		if cmp.visible() then
            			cmp.select_prev_item(select_opts)
            		elseif require("luasnip").jumpable(-1) then
            			require("luasnip").jump(-1)
            		else
            			fallback()
            		end
            end, { "i", "s" })
          '';
        };
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:MyCursorLine";
          side_padding = 0;
        };

        window = {
          completion = {
            winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:Pmenu";
            border = "rounded";
            scrollbar = false;
            col_offset = -3;
            side_padding = 0;
          };
          documentation = {
            scrollbar = false;
            winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder";
            border = "rounded";
          };
          snippet = {
            winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder";
            border = "rounded";
          };
        };

        formatting = {
          fields = ["kind" "abbr" "menu"];
        };

        snippet = {expand = "luasnip";};

        sources = [{name = "nvim_lsp";} {name = "luasnip";} {name = "path";} {name = "buffer";}];

        preselect = "cmp.PreselectMode.None";
        sorting = {
          comparators = [
            "cmp.config.compare.exact"
            "cmp.config.compare.recently_used"
            "cmp.config.compare.score"
          ];
        };

        completeopt = "menu,menuone,noinsert";
        performance = {
          max_view_entries = 15;
        };
      };

      cmdline = {
        "/" = {
          mapping = {__raw = "cmp.mapping.preset.cmdline()";};
          sources = [{name = "buffer";}];
        };
        ":" = {
          mapping = {__raw = "cmp.mapping.preset.cmdline()";};
          sources = [
            {name = "path";}
            {
              name = "cmdline";
              option = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
          ];
        };
      };
    };
  };
}
