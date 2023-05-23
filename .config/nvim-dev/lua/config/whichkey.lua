local M = {}

function M.setup()
	local ok_whichkey, whichkey = pcall(require, "which-key")
  if not ok_whichkey then
    return
  end

	local conf = {
		window = {

			-- Opts: none, single, double, shadow
			border = "single",

			-- Opts: bottom, top
			position = "bottom",
		},
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			c = { "<Cmd>bd!<CR>", "Close current buffer" },
			D = { "<Cmd>%bd|e#|bd#<CR>", "Delete all buffers" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		g = {
			name = "Git",
			s = { "<cmd>Neogit<CR>", "Status" },
		},

		f = {
			name = "Find",
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
