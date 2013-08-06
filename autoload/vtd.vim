let s:plugin_root = expand('<sfile>:p:h:h')

" TODO(chiphogg): Write a "join paths" function and use that instead.
let s:python_path = s:plugin_root . '/python'


function! s:EnsurePythonScriptsLoaded()
  if !exists('s:loaded_python_scripts')
    execute 'pyfile' s:python_path . '/vtd.py'
    let s:loaded_python_scripts = 1
  endif
endfunction


function! vtd#UpdatePython()
  call s:EnsurePythonScriptsLoaded()
  execute 'python UpdateTrustedSystem(file_name="' . g:vtd_file .'")'
endfunction
