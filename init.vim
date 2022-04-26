"                       Источник: https://github.com/alexey-goloburdin/nvim-config
"
"                         ------------------------------------------------------
"                         |  я   первоисточник,   конечно,   очень   серьезно  |
"                         |  переработал, что в пору говорить уже про корабль  |
"                         |  Тесея, но все равно укажу, от чего я оттлакивал-  |
"                         |  ся. Можете свободно копировать все мои  конфиги,  |
"                         |  учитывая, что некоторые из них далеко не мои. Но  |
"                         |  ссылки  на  оригиналы   я   оставил   во   всех.  |
"                         ------------------------------------------------------
"
call plug#begin('~/.vim/plugged')
"
" =================================================================================================
"                                                Плагины                                          |
" =================================================================================================
"                                                                                                 |
"                                                                                                 |
" ----------------------------------------===    Основные    ===-----------------------------------
"                                                                                                 |
Plug 'neovim/nvim-lspconfig'              " \                                                     | 
Plug 'saadparwaiz1/cmp_luasnip'           " -\                                                    |
Plug 'hrsh7th/nvim-cmp'                   " --\                                                   |
Plug 'hrsh7th/cmp-nvim-lsp'               " ---\                                                  |
Plug 'hrsh7th/cmp-vsnip'                  " ---- Вспомогательные файлы для init.vim, Lua и LSP.   |
Plug 'hrsh7th/cmp-path'                   " ---/                                                  |
Plug 'hrsh7th/cmp-buffer'                 " --/                                                   |
Plug 'hrsh7th/vim-vsnip'                  " -/                                                    |
Plug 'L3MON4D3/LuaSnip'                   " /                                                     |
"                                                                                                 |     
Plug 'scrooloose/nerdcommenter'           " Удобная постановка комментариев                       |
Plug 'jiangmiao/auto-pairs'               " Закрытие парных скобок и кавычек                      |
Plug 'sheerun/vim-polyglot'               " Более хорошая подсветка синтаксиса                    |
Plug 'easymotion/vim-easymotion'          " Более простые прыжки к кускам кода                    |
Plug 'mattn/emmet-vim'                    " Emmet для vim                                         |
Plug 'tpope/vim-surround'                 " Удобное оборачивание текста (Emmet для остального)    |
Plug 'kyazdani42/nvim-tree.lua'           " Файловое дерево                                       |
Plug 'kyazdani42/nvim-web-devicons'       " Фикс инокок вместо вопросиков                         |
Plug 'romgrk/barbar.nvim'                 " Панель вкладок для neovim                             |
"                                                                                                 |
" ----------------------------------------=== Цветовые схемы ===-----------------------------------
"                                                                                                 |
Plug 'mhartington/oceanic-next'           " \                                                     |
Plug 'ayu-theme/ayu-vim'                  " - Цветовые схемы                                      |
Plug 'wojciechkepka/vim-github-dark'      " /                                                     |
"                                                                                                 |
Plug 'vim-airline/vim-airline'            " Нижняя панель                                         |
Plug 'vim-airline/vim-airline-themes'     " Темы нижней панели                                    |
"                                                                                                 |
" ----------------------------------------===      Git       ===-----------------------------------
"                                                                                                 |
Plug 'mhinz/vim-signify'                  " Core-плагин для поддержки Git                         |
Plug 'tpope/vim-fugitive'                 " Git команды для vim/neovim                            |
"                                                                                                 |
" ----------------------------------------===     Python     ===-----------------------------------
"                                                                                                 |
Plug 'mitsuhiko/vim-jinja'		          " Поддержка языка Jinja для neovim                      |
"                                                                                                 |
" ----------------------------------------===      Rust      ===----------------------------------|
"                                                                                                 |
Plug 'simrat39/rust-tools.nvim'           " Вкл. фич rust-analyzer                                |
"                                                                                                 |
" =================================================================================================

call plug#end()                                        


" =================================================================================================
" =                                           Настройки neovim                                    =
" =================================================================================================
"                                                                                                 |
"                                                                                                 |
" ----------------------------------===           Основное           ===---------------------------
"
set nocompatible                              " Что-то полезное
set mouse=a                                   " Расширенный режим для мыши
set encoding=utf-8                            " Основная кодировка по умолчаюнию - utf-8
set number                                    " Нумерация строк
set noswapfile                                " Отключить swap-файлы для neovim
set scrolloff=7                               " Расстояние сверху и снизу при скроле для курсора
"
set clipboard+=unnamedplus                    " Тип буфера обмена
set tabstop=4                                 " Число пробелов в Tab'е
set softtabstop=4                             " Почти то же, что и tabstop
set shiftwidth=4                              " Сдвиг = Tab, но для плагинов
set expandtab                                 " Замена Tab'а на пробелы
set autoindent                                " Сохранение отступа строки при переходе на новую
set fileformat=unix                           " Формат файла (neovim использую всегда на linux)
filetype indent on                            " Вкл. идентификация редактируемого в nvim файла
"
set completeopt=menuone,noinsert,noselect     " Сценарии, когда выпадающее меню может появиться
set shortmess+=c                              " Предотвр. показ доп сообщений при comlete 
set updatetime=300                            " Время обновления состояния файла и CursorHold 
"
" ----------------------------------===  Инициализация темы neovim   ===---------------------------

set termguicolors                             " Вкл. 24-битный режим цветов
colorscheme ayu                               " Цветовая схема
let ayucolor='dark'                           " Тип цветовой схемы ayu (dark)
let g:airline_theme='ayu_dark'                " Тема для нижней панели neovim
set colorcolumn=100                           " Рулетка, показывающая рекомендуемую длину строки

" ----------------------------------===  Настройка горячих клавиш    ===---------------------------

" Использование базовых команд с русской раскладкой
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a

" Очищение подсветки поиска
nnoremap <silent> <esc><esc> :let @/=""<CR>

" Терминал 
nnoremap <silent> <leader><leader>j :terminal<CR>
" Выйти в Normal mode терминала
tnoremap <silent> <Esc> <C-\><C-n>

" Вкл/выкл git изменения
nnoremap <silent> <leader><leader>g :SignifyToggle<CR>
" Вкл/выкл подсветку строк git
nnoremap <silent> <leader><leader>h :SignifyToggleHighlight<CR>

" Закрепить/открепить дерево
nnoremap <silent> <F2> :NvimTreeToggle<CR>
" Обновить файловое дерево
nnoremap <silent> <leader><leader>r :NvimTreeRefresh<CR>

" Следующий буфер
nnoremap <silent> <A-,> :bn<CR>
" Предыдущий буфер
nnoremap <silent> <A-.> :bp<CR>

" Переход к n буферу
nnoremap <silent> <A-1> :BufferGoto 1<CR>
nnoremap <silent> <A-2> :BufferGoto 2<CR>
nnoremap <silent> <A-3> :BufferGoto 3<CR>
nnoremap <silent> <A-4> :BufferGoto 4<CR>
nnoremap <silent> <A-5> :BufferGoto 5<CR>
nnoremap <silent> <A-6> :BufferGoto 6<CR>
nnoremap <silent> <A-7> :BufferGoto 7<CR>
nnoremap <silent> <A-8> :BufferGoto 8<CR>
nnoremap <silent> <A-9> :BufferGoto 9<CR>
" Последний буфер
nnoremap <silent> <A-0> :BufferLast<CR>

" Переместить буфер назад
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
" Переместить буфер вперед
nnoremap <silent> <A->> :BufferMoveNext<CR>

" Закрепить / открепить буфер
nnoremap <silent> <leader>p :BufferPin<CR>

" Закрыть буфер
nnoremap <silent> <A-c> :BufferClose<CR>
" Принудительное закрытие буфура
nnoremap <silent> <leader><leader>k :bd!<CR>

" Запуск текущего python-файла
nnoremap <silent> <F3> :! python3 % <CR>

"-----------------------------------===   Автоматические команды    ===----------------------------

" показывает ошибки/предупреждения развернуто спустя какое-то время
autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})
" удаление пробелов в конце строки
autocmd BufWritePre *.py :%s/\s\+$//e

" ----------------------------------=== Шпора по встроенным хоткеям ===----------------------------

" <leader><leader>w   -   прыжок вперед по паттернам
" <leader><leader>b   -   прыжок назад по паттернам
" <leader><leader>s   -   прыжок к паттерну введенной буквы
" <leader><leader>f   -   прыжок к паттерну введенной буквы (вперед)
" K                   -   справка о функции/классе/методе
" <Ctrl-y>,           -   wrap в Emmet
" <A-p>               -   вкл/выкл. постановку парных кавычек/скобок и т.д.

" =================================================================================================



" ----------------------------------===        Что-то на Lua        ===----------------------------
lua << EOF
require'nvim-tree'.setup()
EOF

lua << EOF
vim.o.completeopt = 'menuone,noselect'

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

lua <<EOF
local nvim_lsp = require('lspconfig')

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_action = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {command = "clippy"},
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF


lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local servers = { 'pyright'} 
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF



if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>

