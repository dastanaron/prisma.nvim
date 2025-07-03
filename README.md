# prisma.nvim

A lightweight Prisma ORM integration for Neovim with native LSP support, syntax highlighting, and auto-formatting.

## Features

- 🌟 Automatic Prisma Language Server installation via Mason
- 🎨 Treesitter highlighting for `.prisma` files
- ⚡ Native LSP integration with `nvim-lspconfig`
- ✨ Auto-formatting on save
- 🔧 Customizable LSP settings
- ## Requirements

- Neovim 0.8+
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Installation

### Packer.nvim
```lua
use {
    'dastanaron/prisma.nvim',
    requires = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        require('prisma').setup()
    end
}
````

### Lazy.nvim

```lua
{
    'dastanaron/prisma.nvim',
    event = "VeryLazy",
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        require('prisma').setup()
    end
    opts = {
        -- default configuration
    }
}
```

## Configuration

### Default Setup

```lua
require('prisma').setup({
    auto_format = true,  -- Enable format-on-save
    lsp = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
            -- LSP server specific settings
        },
        on_attach = function(client, bufnr)
            -- Custom LSP attach handler
        end
    }
})
```

## Usage

### Basic Workflow

1. Open any `.prisma` file
2. The plugin will automatically:
    - Install Prisma Language Server (if missing)
    - Set up Treesitter parser
    - Attach LSP functionality

### LSP Commands

```vim
" Format current buffer
:LspFormat

" Show schema diagnostics
:LspInfo

" Show documentation
K
```

### Custom Keybindings

Add to your `on_attach` handler:

```lua
require('prisma').setup({
    lsp = {
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end
    }
})
```

## Customization

### Disable Auto-format

```lua
require('prisma').setup({ auto_format = false })
```

### Custom LSP Settings

```lua
require('prisma').setup({
    lsp = {
        settings = {
            prisma = {
                validate = true,
                completions = {
                    enable = true
                }
            }
        }
    }
})
```

## Troubleshooting

### Manual LSP Installation

```vim
:MasonInstall prisma-language-server
```

### Manual Treesitter Install

```vim
:TSInstall prisma
```

---

**Enjoy Prisma development in Neovim!** 🚀

```

This README includes:
1. Clear installation instructions for popular package managers
2. Configuration examples
3. Usage patterns
4. Common customization scenarios
5. Troubleshooting section
6. Animated demo placeholder (you should add real screenshots/GIFs)

You might want to:
1. Add actual demo GIFs
2. Include contribution guidelines
3. Add a feature comparison table with coc-prisma
4. Add CI/CD badges if you set up automated testing
5. Include Prisma version compatibility information
```
