" Excute pathiogen
execute pathogen#infect()
call pathogen#helptags()

"set term=nxterm

" Set tab stop - how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide. Visual Studio expects each tab to be four columns wide. This is the only command here that will affect how existing text displays
" Set soft tab stop - how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces
" Set tab indentation - how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation
" Set no expand tab - when expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces
:set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab


" Indent following lines to the indentation of previous line.
set autoindent

" set indentation
set cindent

" Display when in Insert, Append or Replace mode on the bottom side
set showmode

" Show line numbers on right side of each line
set number

" Display line and column numbers in bottom right side
set ruler

" filetype
filetype plugin indent on

" Show special characters in the file
"set list

set nocompatible
set backspace=2
set foldmethod=marker

" set color sheme
colorscheme default

" highlight Normal ctermfg=black ctermbg=yellow

set t_Co=256

" Hide the mouse when typing text
set mousehide

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"map <C-v> <MiddleMouse>
"map! <C-v> <MiddleMouse>


map <C-Space> <C-n>
map! <C-Space> <C-n>


" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
	syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" Set font
"set gfn=Courier\ 10\ Pitch\ 12
"set gfn=Courier\ 10\ Pitch\ 10

""""""""""""""""" Tlist
" Open the taglist window when Vim starts.
"autocmd VimEnter * Tlist " instead of let Tlist_Auto_Open=1
" Place the taglist window on the right side.
let Tlist_Use_Right_Window=1
" Show tags for the current buffer only.
let Tlist_Show_One_File=1


"Tags plugin
map <F2> :TagbarToggle<CR>

"Nerd tree plugin
map <F3> :NERDTreeToggle<cr>

"map F7  F8 to swich tabs
map <F6> :tabp<cr>
inoremap <F6> <C-o>:tabp<cr>
map <F7> :tabn<cr>
inoremap <F7> <C-o>:tabn<cr>

" set split to right and below instead of left and above
set splitright
set splitbelow

" toggle hidden chrachters
nmap <leader>l :set list!<CR>

" Launch white space removal
nmap _$ :call <SID>StripTrailingWhitespaces()<CR>

" remove white spaces accross the file
function! <SID>StripTrailingWhitespaces()
" save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
" Clean up: restore previous search history,
	let @/=_s
	call cursor(l, c)
endfunction"

" open files easly
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" run Wrap to change the wrapping to words
command! -nargs=* Wrap set wrap linebreak nolist
Wrap

" map numbers on of toggle
map <leader>nu :set nu!<CR>

" Move easyly between visual lines
vmap <C-j> gj
vmap <C-k> gk


" some iretating commands
command Q q
command W w
command Wq wq
command WQ wq
command WA wa
command Wa wa
command Qa qa
command QA qa

" noremap for arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"A function to toggle white spaces on and off using <F5>
let s:hilightws = 1
fun ToggleSpell()
	if s:hilightws
		setlocal spell spelllang=en_us spell! spell?
		2mat ErrorMsg '\%81v.'
		ToggleWhitespace
		let s:hilightws = 0
    else
		setlocal spell spelllang=en_us
		ToggleWhitespace
        let s:hilightws = 1
    endif
endfun
highlight ExtraWhitespace ctermbg=green guibg=lightgreen
map <F5> :call ToggleSpell() <cr>

"All kinds of addings to make word complete easier
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

if has("gui_running")
	" Turn on spell checker
	set spell

	" GUI window position and size - should be enough for 2 tabs + Tlist
	winpos 214 20
	set lines=999
	set columns=999

	" set vertical column to 80 characters
	"set colorcolumn=80
endif

" Python plugins additions
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

 " Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

 " Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"


