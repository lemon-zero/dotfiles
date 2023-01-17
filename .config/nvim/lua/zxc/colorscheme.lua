local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

catppuccin.setup({
	transparent_background = true,
})

local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status_ok then
	return
end
gruvbox.setup({
	transparent_mode = true,
})

local transparent_status_ok, transparent = pcall(require, "transparent")
if not transparent_status_ok then
	return
end

transparent.setup({
	enable = true,
	extra_groups = {},
	exclude = {},
})

local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
