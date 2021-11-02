function _G.typescript_indent()
  local line = vim.fn.getline(vim.v.lnum)
  local prev_line = vim.fn.getline(vim.v.lnum - 1)
  if line:match('^%s*[%*/]%s*') then
    print "match"
    if prev_line:match('^%s*%*%s*') then
      print "match1"
      return vim.fn.indent(vim.v.lnum - 1)
    end
    if prev_line:match('^%s*/%*%*%s*$') then
      print "match2"
      return vim.fn.indent(vim.v.lnum - 1) + 1
    end
  end

  return vim.fn['GetJavascriptIndent']()
end

vim.cmd[[autocmd FileType typescript setlocal indentexpr=v:lua.typescript_indent()]]
