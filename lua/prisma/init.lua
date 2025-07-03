local M = {}

function M.setup(opts)
    local conf = vim.tbl_deep_extend("force", {
        auto_format = true,
        lsp = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = nil,
            settings = {}
        }
    }, opts or {})

    local mason_registry = require("mason-registry")
    if not mason_registry.is_installed("prisma-language-server") then
        vim.cmd.MasonInstall("prisma-language-server")
    end

    local has_parser = pcall(function()
        return require("nvim-treesitter.parsers").get_parser_configs().prisma
    end)

    if not has_parser then
        vim.cmd.TSInstall("prisma")
    end

    require('prisma.lsp').setup(conf)
end

return M
