local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

catppuccin.setup({})

local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status_ok then
	return
end
gruvbox.setup({})

local transparent_status_ok, transparent = pcall(require, "transparent")
if not transparent_status_ok then
	return
end

transparent.setup({
	enable = true,
	extra_groups = { -- table/string: additional groups that should be cleared
		"all",
	},
	exclude = {},
})

local colorscheme = "rose-pine"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
