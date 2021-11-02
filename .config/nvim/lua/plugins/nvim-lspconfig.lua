local lspconfig = require 'lspconfig'

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = {
  "bashls",
  efm = function()
    return {
      init_options = {documentFormatting = true},
      filetypes = {"lua"},
      settings = {
        rootMarkers = {"./git"},
        languages = {
          lua = {
            {
              formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --column-table-limit=1 --break-after-table-lb",
              formatStdin = true,
            }
          }
        }
      }
    }
  end,
  "gopls",
  "graphql",
  html = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return {capabilities = capabilities}
  end,
  "jsonls",
  "rust_analyzer",
  sumneko_lua = function()
    local nvim_path = vim.fn.stdpath('config')
    local sumneko_root_path = nvim_path .. "/lua-language-server"
    local sumneko_binary = sumneko_root_path .. '/bin'

    if vim.fn.has("mac") == 1 then
      sumneko_binary = sumneko_binary .. "/macOS/lua-language-server"
    elseif vim.fn.has("unix") == 1 then
      sumneko_binary = sumneko_binary .. "/Linux/lua-language-server"
    else
      print("Unsupported system for sumneko")
    end

    return {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = {'vim'}
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            }
          }
        }
      }
    }
  end,
  "terraformls",
  "tsserver",
  "vimls",
  "yamlls",
}

-- Set up servers
for key, value in pairs(servers) do
  local config = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  local name = type(value) == "string" and value or key

  if type(value) == "function" then
    local server_config = value()
    for key, value in pairs(server_config) do
      config[key] = value
    end
  end

  lspconfig[name].setup(config)
end
