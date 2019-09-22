" Workflow configuration for https://github.com/phpactor/phpactor

" Please make sure that phpactor is available
" ln -s ~/.vim/bundles/phpactor/bin/phpactor /usr/local/bin/phpactor

function! PHPModify(transformer)
	:w
	exe "!phpactor class:transform ".expand('%').' --transform='.a:transformer
	:e
endfunction

nnoremap <leader>cc :call PHPModify("complete_constructor")<cr>
nnoremap <leader>ci :call PHPModify("implement_contracts")<cr>
nnoremap <leader>cp :call PHPModify("add_missing_properties")<cr>
nnoremap <leader>re :call PHPModify("rename_variable")<cr>

nnoremap <C-T> :call phpactor#ContextMenu()<cr>
vmap <C-T> :call phpactor#ExtractExpression(v:true)<cr>

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
