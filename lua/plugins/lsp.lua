return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              local active_clients = vim.lsp.get_active_clients()
              if client.name == "denols" then
                for _, client_ in pairs(active_clients) do
                  -- stop tsserver if denols is already active
                  if client_.name == "tsserver" then
                    client_.stop()
                  end
                end
              elseif client.name == "tsserver" then
                for _, client_ in pairs(active_clients) do
                  -- prevent tsserver from starting if denols is already active
                  if client_.name == "denols" then
                    client.stop()
                  end
                end
              end
              client.server_capabilities.documentFormattingProvider = false
            end
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
        denols = function(_, opts)
          local nvim_lsp = require("lspconfig")

          local on_attach = function(client, _)
            if client.name == "denols" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end

          nvim_lsp.denols.setup({
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
          })
          return true
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
      },
    },
  },
}
