// Tooltip when hovering over upgrade
if (position_meeting(mouse_x, mouse_y, self)) {	
	
	// Increment counter
	counter++;
	
	// Counter time check
	if (counter >= room_speed * 0.4) {
		
		// Draw the tooltip
		draw_set_colour(tooltip_colour);
		tooltip_x = x - 20;
		tooltip_y = mouse_y;
		tooltip_width = 250;
		tooltip_height = 200;
		draw_roundrect(tooltip_x, tooltip_y, tooltip_x - tooltip_width, tooltip_y + tooltip_height, false);
		draw_set_colour(-1);
		
		// Draw the description
		var tooltip_left = tooltip_x - tooltip_width;
		var tooltip_bottom = tooltip_y + tooltip_height;
		var tooltip_buffer = 10;
		
		draw_set_font(fn_tooltip);
		
		var _string = description;
		var plural;
		if (quantity > 1) { plural = "s" } else { plural = "" }
		
		draw_text_ext(tooltip_left + tooltip_buffer, tooltip_y + tooltip_buffer, 
			// Title
			"[" + label + "]" + "\n\n" + 
			// Description
			_string + "\n\n" + 
			// Information
			"Each " + label + " gets " + string(marks_per_second) + " marks per second" + "\n\n" +
			// Statistics
			string(quantity) + " " + label + plural + " getting " + string(marks_per_second*quantity) + " marks per second", 
			
			
			string_height(_string) + 1, 
			tooltip_width-15
		);
		
		draw_set_font(-1);
		
		
	}
} else {
	// Reset counter
	counter = 0;
}