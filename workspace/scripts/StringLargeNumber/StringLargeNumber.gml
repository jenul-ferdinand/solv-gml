/// @func StringLargeNumber()
/// @desc Make large numbers more readable

function StringLargeNumber(number) {
	var number_prefix = 0;
	var number_suffix = "";

	// Million (6 Zeros)
	if (number > 999999 && number < 1000000000) {
		number_prefix = number / 1000000;
		number_suffix = "Million";
	}
	// Billion (9 Zeros)
	else if (number > 999999999 && number < 1000000000000) {
		number_prefix = number / 1000000000;
		number_suffix = "Billion";
	}
	// Trillion (12 Zeros)
	else if (number > 999999999999 && number < 1000000000000000) {
		number_prefix = number / 1000000000000;
		number_suffix = "Trillion";
	}
	// Quadrillion (15 Zeros)
	else if (number > 999999999999999 && number < 1000000000000000000) {
		number_prefix = number / 1000000000000000;
		number_suffix = "Quadrillion";
	}
	// Quintillion (18 Zeros)
	else if (number > 999999999999999999 && number < 1000000000000000000000) {
		number_prefix = number / 1000000000000000000;
		number_suffix = "Quintillion";
	}
	// Sextillion (21 Zeros)
	else if (number > 999999999999999999999 && number < 1000000000000000000000000) {
		number_prefix = number / 1000000000000000000000;
		number_suffix = "Sextillion";
	}
	// Septillion (24 Zeros)
	else if (number > 999999999999999999999999 && number < 1000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000;
		number_suffix = "Septillion";
	}
	// Octillion (27 Zeros)
	else if (number > 999999999999999999999999999 && number < 1000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000;
		number_suffix = "Octillion";
	}
	// Nonillion (30 Zeros)
	else if (number > 999999999999999999999999999999 && number < 1000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000;
		number_suffix = "Nonillion";
	}
	// Decillion (33 Zeros)
	else if (number > 999999999999999999999999999999999 && number < 1000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000;
		number_suffix = "Decillion";
	}
	// Undecillion (36 Zeros)
	else if (number > 999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000;
		number_suffix = "Undecillion";
	}
	// Duodecillion (39 Zeros)
	else if (number > 999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000;
		number_suffix = "Duodecillion";
	}
	// Tredecillion (42 Zeros)
	else if (number > 999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000;
		number_suffix = "Tredecillion";
	}
	// Quattuordecillion (45 Zeros)
	else if (number > 999999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000000;
		number_suffix = "Quattuordecillion";
	}
	// Quindecillion (48 Zeros)
	else if (number > 999999999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000000000;
		number_suffix = "Quindecillion";
	}
	// Sexdecillion (51 Zeros)
	else if (number > 999999999999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000000000000;
		number_suffix = "Sexdecillion";
	}
	// Septendecillion (54 Zeros)
	else if (number > 999999999999999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000000000000000;
		number_suffix = "Septendecillion";
	}
	// Octodecillion (57 Zeros)
	else if (number > 999999999999999999999999999999999999999999999999999999999 && number < 1000000000000000000000000000000000000000000000000000000000000) {
		number_prefix = number / 1000000000000000000000000000000000000000000000000000000000;
		number_suffix = "Octodecillion";
	}
	// Novemdecillion (60 Zeros)
	else if (number > 999999999999999999999999999999999999999999999999999999999999) {
		number_prefix = number / 1000000000000000000000000000000000000000000000000000000000000;
		number_suffix = "Novemdecillion";
	}
	else { 
		return StringThousands(number);	
	}
	
	// Return the value as 3 decimal places with suffix attached
	return string(string_format(number_prefix, 1, 3)) + " " + number_suffix;
}