local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath", 
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    },
    stdin = true,
  }
end

require('formatter').setup {
  logging = false,
  filetype = {
    javascript = {prettier},
    typescript = {prettier},
    javascriptreact = {prettier},
    typescriptreact = {prettier},
    markdown = {prettier},
    mdx = {prettier},
    json = {prettier},
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true,
        }
      end
    },
    sol = {prettier},
    solidity = {prettier},
  }
}

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.json,*.md,*mdx,*.js,*.jsx,*.ts,*.tsx,*.rs,*.sol FormatWrite
augroup END
]], true)
