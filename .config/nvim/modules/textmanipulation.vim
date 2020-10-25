function! Centre()
	exec 's/^[[:space:]]*//'
	normal $
	let cols=col(".")+1
	let offset=(80-cols)/2
	let c=0
	while c < offset
		let c+=1
		exec 's/^/ /'
	endwhile
	echo c
endfunction

function! PlaceCC()
	let cols=col(".")
	exec 'set cc=' . cols
endfunction
