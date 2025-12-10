local vue_language_server_path = vim.fn.expand("xxx") 
--  自己vue-language-server安装的路径

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {},
        vue_ls = {},
      },
      setup = {
        ts_ls = function(server, opts)
          opts.init_options = opts.init_options or {}
          opts.init_options.plugins = opts.init_options.plugins or {}
          table.insert(opts.init_options.plugins, {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          })
          opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
          return false
        end,

        vue_ls = function(_, opts)
          opts.filetypes = { "vue" }
          return false
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vue",
        "jsx",
        "tsx",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
    },
  },
}