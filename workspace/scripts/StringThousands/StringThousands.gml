/// @func StringThousands(integer)

function StringThousands(_integer){
	var r, i;
	r = string(_integer)
	for (i = string_length(r) - 2; i > 1; i -= 3) {
	    r = string_insert(",", r, i)
	}
	return r
}