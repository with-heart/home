local au = require'utils.au'

au.augroup('Lightbulb', {
  {
    event = 'CursorHold,CursorHoldI',
    pattern = '*',
    callback = function()
      require'nvim-lightbulb'.update_lightbulb()
    end
  }
})
