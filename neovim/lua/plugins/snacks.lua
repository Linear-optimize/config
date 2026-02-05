return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = {
      enabled = true,
     
      env = { name = "wezterm" },
     
      placeholder = false,
      force_magick = true,
  
      cache = vim.fn.stdpath("cache") .. "/snacks/image",
    },
    doc = {
      enabled = true,
      inline = true,
      render = true,

      render_sleep = 1200,
    },
    math = {
      enabled = true,
      default_renderer = "tectonic",
    },
  },
  init = function()
 
    local nix_bin = "/etc/profiles/per-user/rene/bin"
    vim.env.PATH = nix_bin .. ":" .. vim.env.PATH
    
    vim.env.WEZTERM_PANE = vim.env.WEZTERM_PANE
  end,
}