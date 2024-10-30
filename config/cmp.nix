{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
        snippet = {
          expand = "luasnip";
        };
        sources = [
          {
            name = "nvim_lsp";
          }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
          {
            name = "buffer";
          }
        ];
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
          formatting = {
            fields = ["kind" "abbr" "menu"];
            format = ''
              function(entry, vim_item)
              	vim_item.kind = (cmp_kinds[vim_item.kind] or "")

              	if entry == "Function" then
              		local item = entry:get_completion_item()

              		log.debug(item)

              		if item.detail then
              			vim_item.menu = item.detail
              		end
              	end

              	vim_item.abbr = vim_item.abbr:match("[^(]+")

              	return vim_item
              end;
            '';
          };
        };
      };
      preselect = "cmp.PreselectMode.None";
      sorting = {
        comparators = [
          "cmp.config.compare.exact"
          "cmp.config.compare.recently_used"
          "cmp.config.compare.score"
        ];
      };
      completeopt = "menu,menuone,noinsert";

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
