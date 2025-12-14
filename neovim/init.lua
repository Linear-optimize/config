-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme duskfox")

vim.api.nvim_set_hl(0, "Normal", {
  bg = "NONE",
  ctermbg = "NONE",
})