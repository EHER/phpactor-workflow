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
