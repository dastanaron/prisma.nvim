local M = {}

function M.setup(config)
    local lspconfig = require('lspconfig')
    local default_on_attach = function(client, bufnr)
        if config.auto_format then
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.prisma",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end
            })
        end

        -- Users handlers
        if config.lsp.on_attach then
            config.lsp.on_attach(client, bufnr)
        end
    end

    local default_on_init = function(client, bufnr)
        if config.lsp.on_init then
            config.lsp.on_init(client, bufnr)
        end
     end

    lspconfig.prismals.setup(vim.tbl_deep_extend("force", {
        filetypes = { 'prisma' },
        on_attach = default_on_attach,
        on_init = default_on_init,
        capabilities = config.lsp.capabilities
    }, config.lsp.settings))
end

return M
