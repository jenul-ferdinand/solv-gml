/// --- Main game loop ---
gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);
mouse_click = mouse_check_button_pressed(mb_left);
mouse_click_release = mouse_check_button_released(mb_left);

// Debugging
if (keyboard_check_pressed(ord("R"))) { game_restart(); }
if (keyboard_check_pressed(vk_escape)) { game_end(); }
if (keyboard_check(ord("W"))) { 
	total_marks += question_value;
	questions_solved++;
	
	RandomiseValues(values_max);
	
	CreateUpgrades();
}

// Limit the string to the maximum chars and allow only digits
keyboard_string = string_copy(string_digits(keyboard_string), 0, char_max);

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
			questions_upgrade *= 2
		}
		
		// Creation of the upgrade
		CreateUpgrades();
		
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



// Scrolling the upgrades
for (var i = 0; i < array_length(upgrade); i++) { 
	// Store the upgrades instances in a local variable
	var upgrades_id = upgrade[i].inst_id;
	
	// Scrolling up moves the upgrades down
	if (mouse_wheel_up() && !scroll_up_locked) { 
		upgrades_id.y += scroll_amount;
	} 
		
	// Scrolling down moves the upgrades up
	if (mouse_wheel_down() && !scroll_down_locked) {
		upgrades_id.y -= scroll_amount;
	}
}

// Limit scrolling above first upgrade
if (upgrade[ARITHMETIC].inst_id.y >= upgrade_y) {
	scroll_up_locked = true;
} else {
	scroll_up_locked = false;	
}

// Limit scrolling below last upgrade
if (upgrade[array_length(upgrade)-1].inst_id.y <= last_upgrade_ybase) {
	scroll_down_locked = true;
} else {
	scroll_down_locked = false;	
}

// Scroll debugging
show_debug_message("first upgrade y: " + string(upgrade[0].inst_id.y));
show_debug_message("fifth upgrade y: " + string(upgrade[4].inst_id.y));
