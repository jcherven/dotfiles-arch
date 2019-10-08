" vi:syntax=vim

function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction

set nocompatible
filetype off

map <SPACE> <leader>

set encoding=utf-8

set fileformats=unix,dos,mac

set t_Co=256

set lazyredraw


