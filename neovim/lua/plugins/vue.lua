local base_path = vim.fn.expand("$HOME/.bun/install/global/node_modules")
local vue_plugin_path = base_path .. "/@vue/language-server/node_modules/@vue/typescript-plugin"

-- 自己vue language server安装的位置

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {},
        volar = {},
      },
      setup = {
        ts_ls = function(_, opts)
          opts.init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_plugin_path,
                languages = { "vue" },
              },
            },
          }
          opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
        end,
        volar = function(_, opts)
          opts.filetypes = { "vue" }
          opts.init_options = {
            vue = {
              hybridMode = true,
            },
          }
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "vue", "jsx", "tsx" })
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },
}