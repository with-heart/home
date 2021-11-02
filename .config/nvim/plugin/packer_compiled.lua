-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/markachandler/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/markachandler/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/markachandler/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/markachandler/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/markachandler/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["formatter.nvim"] = {
    config = { "require'plugins.formatter'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "require'plugins.galaxyline'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require'plugins.nvim-autopairs'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-blame-line"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-blame-line"
  },
  ["nvim-compe"] = {
    config = { "require'plugins.nvim-compe'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "require'plugins.nvim-lightbulb'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "require'plugins.nvim-lspconfig'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require'plugins.nvim-treesitter'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "require'plugins.nvim-ts-autotag'" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-mdx-js"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-mdx-js"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\23colorscheme zephyr\bcmd\18termguicolors\bopt\bvim\0" },
    loaded = true,
    path = "/Users/markachandler/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require'plugins.nvim-lspconfig'
time([[Config for nvim-lspconfig]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require'plugins.formatter'
time([[Config for formatter.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require'plugins.galaxyline'
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
require'plugins.nvim-ts-autotag'
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require'plugins.nvim-autopairs'
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require'plugins.nvim-compe'
time([[Config for nvim-compe]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require'plugins.nvim-treesitter'
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
require'plugins.nvim-lightbulb'
time([[Config for nvim-lightbulb]], false)
-- Config for: zephyr-nvim
time([[Config for zephyr-nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\23colorscheme zephyr\bcmd\18termguicolors\bopt\bvim\0", "config", "zephyr-nvim")
time([[Config for zephyr-nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
