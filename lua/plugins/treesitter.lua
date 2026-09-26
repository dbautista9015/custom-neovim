return
{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
      install_dir = vim.fn.stdpath('data') .. '/site'
    }

    require('nvim-treesitter').install {
      'c',
      'lua',
      'vim',
      'python',
      'markdown',
      'vimdoc',
      'javascript',
    }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 
        'c',
        'lua',
        'vim',
        'python',
        'markdown',
        'vimdoc',
        'javascript',
      },
      callback = function()
        vim.treesitter.start()
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
