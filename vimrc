set autowrite " writes content of files automatically if :make is called
set number " display line numbers
set relativenumber " display relative line numbers
set belloff=all " set bell noise off
set cursorline " highlight the cursorline
set colorcolumn=80 " set line length marker to 80 characters

let mapleader = ","
let g:go_auto_sameids = 1

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/molokai'
" Plug 'SirVer/ultisnips' " snippets for go, errors when enabled, needs fix
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'AndrewRadev/splitjoin.vim' " go: struct split and join
call plug#end()

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.sql setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.html setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.curl setlocal expandtab tabstop=2 shiftwidth=2

let g:rehash256 = 1
let g:molokai_original = 1
" colorscheme molokai
" colorscheme syntastic
let g:airline_theme='papercolor'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" add TODOs with timestamp
" https://vim.fandom.com/wiki/Insert_current_date_or_time
nnoremap <F5> "=strftime("TODO: PAK_%a-%d-%b:%Y-%H-%M-%S-%Z: ")<CR>P
inoremap <F5> <C-R>=strftime("TODO: PAK_%a-%d-%b-%Y:%H-%M-%S-%Z: ")<CR>

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-q> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" links
" https://vim.fandom.com/wiki/Avoid_the_escape_key#Avoiding_the_Esc_key
