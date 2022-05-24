local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not found")
  return
end

local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.6 }
            -- other layout configuration here
        },
        mappings = require("keybindings").telescopeList,
    },

    pickers = {
        find_files = {
            theme = "ivy",
        }
    },
    extensions = {
	    fzf = {
	      fuzzy = true,                    -- false will only do exact matching
	      override_generic_sorter = true,  -- override the generic sorter
	      override_file_sorter = true,     -- override the file sorter
	      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
					       -- the default case_mode is "smart_case"
	    },
	    ["ui-select"] = {
	      require("telescope.themes").get_ivy {
	      }
	    },
  },
})

require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
