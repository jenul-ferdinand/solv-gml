/// --- Main game loop ---

// Debugging
if (keyboard_check_pressed(ord("R"))) { game_restart(); }
if (keyboard_check_pressed(vk_escape)) { game_end(); }

// keyboard_string is a built in function that stores the last 1024 keys the user pressed.
// Limit the string to the maximum chars and allow only digits
keyboard_string = string_copy(string_digits(keyboard_string), 0, str_max);
// Store the string in a variable
type_string = keyboard_string;

// Comparing the values and checking if correct
if (type_string != "" && real(type_string) == (value1 + value2)) {
	
	if (keyboard_check_pressed(vk_enter)) {
		
		points += question_value;
		questions_solved++;
		
		RandomiseValues(values_max);
		
		keyboard_string = "";
	}
	
}

