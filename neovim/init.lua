
require("config.lazy")
vim.cmd("colorscheme duskfox")

-- vim.api.nvim_set_hl(0, "Normal", {
-- bg = "NONE",
-- ctermbg = "NONE",
-- })

local transparent = {
  bg = "NONE",
  ctermbg = "NONE",
}

vim.api.nvim_set_hl(0, "Normal", transparent)
vim.api.nvim_set_hl(0, "NormalNC", transparent)
vim.api.nvim_set_hl(0, "EndOfBuffer", transparent)

-- 浮窗 / dap-ui
vim.api.nvim_set_hl(0, "NormalFloat", transparent)
vim.api.nvim_set_hl(0, "FloatBorder", transparent)

-- 分割线
vim.api.nvim_set_hl(0, "WinSeparator", transparent)

-- dap-ui 专用
vim.api.nvim_set_hl(0, "DapUIVariable", transparent)
vim.api.nvim_set_hl(0, "DapUIScope", transparent)
vim.api.nvim_set_hl(0, "DapUIType", transparent)
vim.api.nvim_set_hl(0, "DapUIValue", transparent)
vim.api.nvim_set_hl(0, "DapUIFrameName", transparent)