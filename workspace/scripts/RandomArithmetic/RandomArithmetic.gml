/// @func RandomArithmetic

function RandomArithmetic(arithmetic_type) {
	
	var output;
	
	switch (arithmetic_type) {
		// Addition
		case 0:
			output = value1 + value2;
			break;
		
		// Subtraction
		case 1:
			output = value1 - value2;
			break;
			
		// Multiplication
		case 2:	
			output = value1 * value2;
			break;
		
		// Division
		case 3:
			output = value1 / value2;
			break;
	}
	
	return output;
}