// Assigned functions
mouse_over = position_meeting(mouse_x, mouse_y, self);
mouse_click = mouse_check_button_pressed(mb_left);

// Purchasing the upgrade
if (total_marks >= cost) { 
	if (mouse_over) {
		
		image_index = 1; // Brightened sprite index
		
		if (mouse_click) {
			
			flash_alpha = 1;										// Flash
	
			total_marks -= cost;									// Reduce cost from total_marks
			
			obj_controller.question_value += question_value;		// Add question value
			obj_controller.marks_per_second += marks_per_second;	// Add total_marks per second
		
			quantity++;												// Increase quantity
			
			cost = round(base_cost * power(1.15, quantity));		// Cost increase
			
			image_index = 0;										// Reset image index
		}
		
	} else { 
		image_index = 0; // Reset image index
	}
}

// Change colour
if (total_marks < cost) { 
	cost_colour = cost_colour_red; 
} else { 
	cost_colour = cost_colour_green;	
}


// Reducing flash
if (flash_alpha > 0) {
	flash_alpha -= 0.05;
}