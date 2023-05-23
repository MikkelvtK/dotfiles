local M = {}

function M.setup()
	require("tokyonight").setup {
		style = "storm",
		styles = {
			keywords = { italics = false },
		},
	}
end

return M
