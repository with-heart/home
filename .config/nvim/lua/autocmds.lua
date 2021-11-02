local au = require'utils.au'

au.augroup('BufInitSettings', {
  {
    event = 'BufEnter',
    pattern = '*',
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions
        - "a" -- Auto formatting is BAD.
        - "t" -- Don't auto format my code. I got linters for that.
        + "c" -- In general, I like it when comments respect textwidth
        + "q" -- Allow formatting comments w/ gq
        - "o" -- O and o, don't continue comments
        + "r" -- But do continue when pressing enter.
        + "n" -- Indent past the formatlistpat, not underneath it.
        + "j" -- Auto-remove comments if possible.
        - "2" -- I'm not in gradeschool anymore
    end
  }
})

au.augroup('YankHighlight', {
  {
    event = 'TextYankPost',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { on_visual = false }
    end
  }
})
