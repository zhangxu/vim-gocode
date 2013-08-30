if exists("b:did_ftplugin_go_install")
	finish
endif

command! -buffer -nargs=1 Install call s:GoInstall(@%, <f-args>)
function! s:GoInstall(file, relpkg)
	let pkg=GoRelPkg(a:file, a:relpkg)
	if pkg != -1
		let output=system('go install '.pkg)
		if !v:shell_error
			echo 'Package '.pkg.' installed'
		else
			echo output
		endif
	else
		echohl Error | echo 'You are not in a go package' | echohl None
	endif
endfunction

let b:did_ftplugin_go_install=1
