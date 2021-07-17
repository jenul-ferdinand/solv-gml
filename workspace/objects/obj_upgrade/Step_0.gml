// Assigned functions
mouse_over = position_meeting(mouse_x, mouse_y, self);
mouse_click = mouse_check_button_pressed(mb_left);

// Purchasing the upgrade
if (total_marks >= cost) { 
	
	cost_colour = c_lime;
	
	if (mouse_over) {
		
		// Brightened sprite index
		image_index = 1;
		
		if (mouse_click) {
			// Flash
			flash_alpha = 1;
		
			// Reduce cost from total_marks
			total_marks -= cost;
		
			// Add question value
			obj_controller.question_value += question_value;
		
			// Add total_marks per second
			obj_controller.marks_per_second += marks_per_second;
			show_debug_message("Marks per second: " + string(obj_controller.marks_per_second))
			
			// Increase quantity
			quantity++;
			
			// Cost increase
			cost = round(base_cost * power(1.15, quantity));
			
			// Reset image index
			image_index = 0;
		}
	} else { 
		// Reset image index
		image_index = 0;	
	}
}

// Change colour
if (total_marks < cost) { 
	cost_colour = c_red; 
} else { 
	cost_colour = c_lime;	
}


// Reducing flash
if (flash_alpha > 0) {
	flash_alpha -= 0.05;
}