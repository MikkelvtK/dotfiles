local M = {}

function M.setup()
	require("nvim-treesitter").setup {
		-- A list of parser names or "all"
		ensure_installed = { "lua" },

		-- Install languages synchronously
		sync_install = false,
		
		highlight = {
			enable = true,
		},
	}
end

return M
