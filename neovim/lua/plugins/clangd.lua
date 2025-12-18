return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup({
      cmd = {
        "/home/rene/.nix-profile/bin/clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
      },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    })
  end,
}