local execute = vim.api.nvim_command
local fn = vim.fn

local download_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


return function()
  if not pcall(require, 'packer') then
    download_packer()
    print 'Downloading packer.nvim...'
    return true
  end

  return false
end
