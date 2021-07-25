/// --- Main game loop --- ( This event runs every frame the game is 60FPS )
			
// Limit the string to the maximum chars and allow only digits
keyboard_string = string_copy(keyboard_string, 0, char_max);

question = RandomArithmetic(arithmetic_type);
// Comparing the values and checking if correct
if (keyboard_string != "" && keyboard_string == string(question)) {
	
	// If user submits answer
	if (keyboard_check_pressed(vk_enter)) {
		
		// Increase total_marks by the question value
		total_marks += question_value; 
		
		// Increment questions solved
		questions_solved++;
		
		// Randomise the two numbers being added/subtracted/multiplied
		RandomiseValues(values_max); 
		
		// Creation of the upgrade
		CreateUpgrades();
		
		// Reset the keyboard_string value
		keyboard_string = "";
		
		// Arithmetic type reset
		arithmetic_type = irandom_range(0, 3);
	}
	
}

// Make sure the values are even numbers if the question is division.
if (arithmetic_type == 3 && (question % 2) != 0) { 
	RandomiseValues(values_max);
}


// Creating a counter to add total_marks per second to the total total_marks
marks_per_second_counter++;
// If the counter exceeds or is the value of the room_speed (one second)
if (marks_per_second_counter >= room_speed) { 
	// Add marks_per_second to the total_marks.
	total_marks += marks_per_second;
	
	// Reset counter
	marks_per_second_counter = 0;
}

// Lerping the displayed total_marks if display marks is less than the total marks.
if (display_marks < total_marks) {
	// Interpolate the displayed marks to the total marks. This gives it a cool effect.
	display_marks = lerp(display_marks, total_marks, display_marks_lerp);
} else {
	// Make sure displayed marks is always the same as the total marks
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
	
	// Get the last upgrade
	if (upgrade[i].inst_id != -1) { 
		last_upgrade_index = i;	
	}
}
// Limit scrolling first upgrade
if (upgrade[0].inst_id.y >= upgrade_y) {
	scroll_up_locked = true;
} else {
	scroll_up_locked = false;	
}
// Limit scrolling last visible upgrade
if (upgrade[last_upgrade_index].inst_id.y <= last_upgrade_ybase) {
	scroll_down_locked = true;
} else {
	scroll_down_locked = false;	
}

// Scroll debugging (only shown in gamemaker ide compiler)
show_debug_message("first upgrade y: " + string(upgrade[0].inst_id.y));
show_debug_message("fifth upgrade y: " + string(upgrade[4].inst_id.y));



// Developer move (for debugging and testing new features quickly)
if (developer_mode) {
	if (keyboard_check_pressed(ord("R"))) { game_restart(); }
	if (keyboard_check_pressed(vk_escape)) { game_end(); }
	if (keyboard_check_pressed(ord("O"))) { debug_display_toggle = !debug_display_toggle; } 
	
	// If holding W increase questions, for debugging. 
	if (keyboard_check(ord("W"))) {
		// Add Marks
		total_marks += question_value;
		
		// Increment questions solved
		questions_solved++;
		
		// Randomise values
		RandomiseValues(values_max);
		
		// Create upgrades 
		CreateUpgrades();
	}
}