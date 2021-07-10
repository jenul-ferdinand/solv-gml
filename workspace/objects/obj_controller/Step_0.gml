/// --- Main game loop ---
gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);
mouse_click = mouse_check_button_pressed(mb_left);

// Debugging
if (keyboard_check_pressed(ord("R"))) { game_restart(); }
if (keyboard_check_pressed(vk_escape)) { window_command_run(window_command_close); }

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
		
		// Difficulty progression (there could be a better way of doing this)
		if (questions_solved == questions_upgrade) {
			values_max++;
			questions_upgrade *= 2;
		}
		
		if (points >= 10) {
			
		}
	}
}