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

// Comparing the values and checking if correct
if (keyboard_string != "" && real(keyboard_string) == (value1 + value2)) {
	if (keyboard_check_pressed(vk_enter)) {
		// Increase total_marks
		total_marks += question_value;
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
		
		// Creation of the upgrade
		for (var i = 0; i < array_length(upgrade_stage); i++) {
			
			// Check all stages and check if already exists
			if (total_marks >= upgrade_stage[i] && upgrade[i].instance_identity == -1) {
				
				// Create an upgrade and assign its properties
				var upgrade_instance = instance_create_layer(upgrade_x, upgrade_y * (i+1), "Instances", obj_upgrade);
				upgrade_instance.stage = upgrade_stage[i];
				upgrade_instance.cost = upgrade[i].cost;
				upgrade_instance.label = upgrade[i].label;
				upgrade_instance.marks_per_second = upgrade[i].marks_per_second;
				upgrade_instance.question_value = upgrade[i].question_value;
				
				upgrade[i].instance_identity = upgrade_instance;
			}
			
		}
		
	}
}

// Creating a counter to add total_marks per second to the total total_marks
marks_per_second_counter++;
// If the counter exceeds or is the value of the room_speed (60)
if (marks_per_second_counter >= room_speed) { 
	// Add amount
	total_marks += marks_per_second;
	
	// Reset counter
	marks_per_second_counter = 0;
}

// Lerping the displayed total_marks
if (display_marks < total_marks) {
	display_marks = lerp(display_marks, total_marks, display_marks_lerp);
} else {
	display_marks = total_marks;	
}
