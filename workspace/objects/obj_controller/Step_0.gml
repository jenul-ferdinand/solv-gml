/// --- Main game loop ---
gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);
mouse_click = mouse_check_button_pressed(mb_left);
mouse_click_release = mouse_check_button_released(mb_left);

// Debugging
if (keyboard_check_pressed(ord("R"))) { game_restart(); }
if (keyboard_check_pressed(vk_escape)) { game_end(); }

// Limit the string to the maximum chars and allow only digits
keyboard_string = string_copy(string_digits(keyboard_string), 0, str_max);
// Store the string in a variable
type_string = keyboard_string;

// Comparing the values and checking if correct
if (keyboard_string != "" && real(keyboard_string) == (value1 + value2)) {
	if (keyboard_check_pressed(vk_enter)) {
		
		// Increase points
		points += question_value;
		questions_solved++;
		
		// Randomise the two numbers being added/subtracted/multiplied
		RandomiseValues(values_max);
		
		// Reset the keyboard_string value
		keyboard_string = ""; 
		
		
		// Difficulty progression
		if (questions_solved == questions_upgrade) {
			values_max++;
			questions_upgrade *= 2;
		}
		
		
		// Creating upgrades
		for (var i = 0; i < array_length(upgrade_stage); i++) {
			
			// Loop through all the stages
			if (points >= upgrade_stage[i] && upgrade[i].instance_identity == -1) {
				
				// Create an upgrade and adding its properties
				var upgrade_instace = instance_create_layer(upgrade_x, 130 * (i+1), "Instances", obj_upgrade);
				upgrade_instace.stage = upgrade_stage[i];
				upgrade_instace.cost = upgrade[i].cost;
				upgrade_instace.label = upgrade[i].label;
				
				upgrade[i].instance_identity = upgrade_instace;
			}
			
		}
		
		
	}
}