" Download updates, install scripts, etc at https://github.com/jtratner/dotfiles
" Heavily based upon: https://github.com/sontek/dotfiles/
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" Rake & Ruby for command-t
" nose, django-nose
" pylint for Pylint
" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" Powerline
"     Awesome vim status bar
"
" Vim-IPython
"     Connect vim and iPython. (with SuperTab, tab completion too)
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Pytest (disabled)
"     Runs your Python tests in Vim.
"
" Command-T
"     Allows easy search and opening of files within a given path
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Pydoc
"    Opens up pydoc within vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" Py.test (disabled)
"    Run py.test test's from within vim
"
" MakeGreen (disabled)
"    Generic test runner that works with nose
"
" Pylint (disabled)
"    Checks python files
" 
" TaskList - special highlighting and quickfix window
"
" tComment - comment and uncomment lines
" voom - two-panel outline view for vim
" ==========================================================
" Pathogen
" ==========================================================
"
"moving pathogen call up here to see if it helps :-/
set nocp
call pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#infect()                     " Only way to get the helptags to install, don't know why
call pathogen#helptags()                   "
source $VIMRUNTIME/macros/matchit.vim      " not on by default for some reason
" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" turn on and off color bar relative to textwidth
" TODO: fix for when textwidth is not zero
command ColorBar  :set colorcolumn=80<CR> "sets colorbar at textwidth
command NoColorBar :set colorcolumn=0<CR>
command T :set textwidth= <CR>
" turn on autowrapping for comments
" TODO: figure out how to convert these into functions so can be accessed by keyword to
" to work even with textwidth off?
" 'ec' - edit comment, 'en' - edit normal, 'ed' - edit done
map <silent><leader>ec :set textwidth=72<CR>:set fo+=t<CR>:set colorcolumn=+0<CR>:exe ':echo "textwidth 72, autowrapping on, go edit"'<CR>
map <silent><leader>en :set textwidth=80<CR>:set fo+=t<CR>:set colorcolumn=+0<CR>:exe ':echo "textwidth 80, autowrapping on, go edit"'<CR>
map <silent><leader>ed :set textwidth=0<CR>:set colorcolumn=0<CR>:set fo-=t<CR>:exe ':echo "autowrapping off"'<CR>
command CommentWrap :set textwidth=72<CR>:set fo+=t<CR>:set colorcolumn=+0<CR>:exe ':echo "textwidth 72, autowrapping on, go edit"'<CR>


" Paste from clipboard
map <leader>p "+p

map <leader>y "+y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>


" sudo write this
cmap W! w !sudo tee % >/dev/null


fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>
"<CR><C-w>l<C-f>:set scrollbind<CR>

""
"restructuredtext / Markdown shortcuts
"
" TODO: make this respect indentation, etc -- not sure how to do that yet
command EqualLine :put=repeat('=', col('$')-1)
command DashLine :put=repeat('-', col('$')-1)

" ==========================================================
" tComment
" ==========================================================
"" note that its commands are:
"gc{motion}   :: Toggle comments (for small comments within one line 
"                    the &filetype_inline style will be used, if 
"                    defined)
"    gcc          :: Toggle comment for the current line
"    gC{motion}   :: Comment region
"    gCc          :: Comment the current line
" also uses <C-_> and <leader>_
"

" ==========================================================
" Powerline
" ==========================================================
" TODO: set up powerline font
" set powerline to fancy symbols
" display short
let g:Powerline_stl_path_style="short"
" change to set color scheme
"let g:Powerline_colorscheme="default"
" change to set powerline theme
"let g:Powerline_theme="default"
"
" ==========================================================
" tasklist
" ==========================================================
" Toggle the tasklist
map <leader>td <Plug>TaskList

" ==========================================================
" pep8
" ==========================================================
" Run pep8
let g:pep8_map='<leader>8'

" ==========================================================
" Py.test
" ==========================================================
" run py.test's
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

" ==========================================================
" MakeGreen
" ==========================================================
"
" run MakeGreen with current file
map <leader>m <Plug>MakeGreen

"
" Run django tests - disabled in favor of vim-ipython
"map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>


" ==========================================================
" NERDTree
" ==========================================================
" open nerdtree
map <leader>n :NERDTreeToggle<CR>

" ==========================================================
" Command-T
" ==========================================================
" Run command-t file search
map <leader>f :CommandT<CR>
"command -nargs=* C :CommandT

" ==========================================================
" Ack
" ==========================================================
" Ack searching
nmap <leader>a <Esc>:Ack!

" ==========================================================
" Gundo
" ==========================================================
" Load the Gundo window
map <leader>g :GundoToggle<CR>

" ==========================================================
" Rope
" ==========================================================
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" MKEQUALS
" Voom
" MKEQUALS
" set Voom to know certain filetypes (keys are vim fts, values are voom modes)
let g:voom_ft_modes = {'markdown': 'markdown', 'python': 'python', 'rst': 'rest'}
map <M-F3> :Voomquit<CR>
map <C-F3> :Voomlog<CR>
map <F3> :Voomtoggle<CR>


" ==========================================================
" vim-ipython
" ==========================================================
" don't let vim-ipython reset settings
" TODO: remove some of these commands/revisit
let g:ipy_perform_mappings=0
" still haven't decided which way I want commands
noremap <silent> <F5> :python run_this_file()<CR>
noremap <silent> <S-F5> :python run_this_line()<CR>
noremap <silent> <F9> :python run_these_lines()<CR>
noremap <silent> <leader>d :py get_doc_buffer()<CR>
noremap <silent> <leader>s :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
noremap <silent> <S-F9> :python toggle_reselect()<CR>
noremap <silent> <C-F6> :python send('%pdb')<CR>
noremap <silent> <F6> :python set_breakpoint()<CR>
noremap <silent> <s-F6> :python clear_breakpoint()<CR>
noremap <silent> <F7> :python run_this_file_pdb()<CR>
noremap <silent> <s-F7> :python clear_all_breaks()<CR>
imap <C-F5> <C-O><F5>
imap <S-F5> <C-O><S-F5>
imap <silent> <F5> <C-O><F5>
map <C-F5> :call <SID>toggle_send_on_save()<CR>
"" Example of how to quickly clear the current plot with a keystroke
"map <silent> <F12> :python run_command("plt.clf()")<cr>
"" Example of how to quickly close all figures with a keystroke
"map <silent> <F11> :python run_command("plt.close('all')")<cr>

"pi custom
"map <silent> <C-Return> :python run_this_file()<CR>
"map <silent> <C-s> :python run_this_line()<CR>
"imap <silent> <C-s> <C-O>:python run_this_line()<CR>
"map <silent> <M-s> :python dedent_run_this_line()<CR>
"vmap <silent> <C-S> :python run_these_lines()<CR>
"vmap <silent> <M-s> :python dedent_run_these_lines()<CR>
"map <silent> <M-c> I#<ESC>
"vmap <silent> <M-c> I#<ESC>
"map <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>
"vmap <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins

"call pathogen#infect('~/.vim/bundle')
"call pathogen#runtime_append_all_bundles() " set up all plugins managed with pathogen
"call pathogen#helptags()                   " regenerate helptags from pathogen plugins

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set encoding=utf-8            " Necessary for powerline to show unicode glyphs

" don't bell or blink
set noerrorbells
set vb t_vb=
set novisualbell

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
"inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    colorscheme xoria256
    " keep menubar only
    set guioptions=m
    set novisualbell
    " set powerline to fancy
    let g:Powerline_symbols="fancy"
else
    " set powerline to normal instead (otherwise superugly)
    colorscheme xoria256
endif



" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html set omnifunc=htmlcompletion#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS



" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" set the coloring for errors to be readable :P
"au FileType python hi SpellBad term=reverse ctermfg = black ctermbg=9 gui=undercurl guisp=Red
" set up Pylint so it can be used to check python files
"autocmd FileType python compiler pylint
" don't run pylint on every save (instead run by :make in a python file)
"let g:pylint_onwrite=0
" uncomment to disable pylint in quickfix window
"let g:pylint_cwindow=0

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0
" make tab completion context sensitive
let g:SuperTabDefaultCompletionType = "context"


" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUALENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

# load PYTHONPATH into vim, this lets you hover over a module name
# and type 'gf' (for goto file) and open that file in vim. Useful
# and easier than rope for simple tasks
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


 """""""" things to try later

" :DiffSaved to see diff of current buffer and version on disk
" function! s:DiffWithSaved()
  " let filetype=&ft
  " diffthis
  " vnew | r # | normal! 1Gdd
  " diffthis
  " exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
" endfunction
" com! DiffSaved call s:DiffWithSaved()
" map <Leader>ds :DiffSaved<CR>

" function! OpenHgChangedFiles()
  " let status = system('hg status -nm')
  " let filenames = split(status, "\n")
  " exec "edit " . filenames[0]
  " for filename in filenames[1:]
    " exec "tabnew " . filename
  " endfor
" endfunction
" command! OpenHgChangedFiles :call OpenHgChangedFiles()
" map <Leader>oc :OpenHgChangedFiles<CR>



" just some possibilities for later

"if filereadable(expand("~/.vimrc.local"))
      "source ~/.vimrc.local
"endif

"if hostname() == "foo"
"" do something
"endif
"
"""" Old Junk I don't want to forget about:

""" Completion colors and highlights - incredibly ugly defaults
"hi Pmenu ctermbg=DarkCyan guibg=DarkCyan guifg=White
"hi PmenuSel ctermbg=8 guibg=DarkGrey
"hi PmenuSbar ctermbg=7 guibg=Grey
"hi PmenuThumb cterm=reverse gui=reverse
