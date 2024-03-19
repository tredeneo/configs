return { -- notificações, ea aparencia legal pra tudo
	"folke/noice.nvim",
	config = function()
		require("noice").setup({
			lsp = {
				signature = { enabled = false },
				progress = { enabled = false },
			},
			messages = {
				-- view_history = false,
			},
		})
	end,
	dependencies = {
		"rcarriga/nvim-notify",
		"MunifTanjim/nui.nvim",
	},
	tag = "*",
}
