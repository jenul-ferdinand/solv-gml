var gui_mousex = device_mouse_x_to_gui(0);
var gui_mousey = device_mouse_y_to_gui(0);

// Tooltip when hovering over upgrade
if (position_meeting(mouse_x, mouse_y, self)) {	
	
	// Increment counter
	counter++;
	
	// If counter is greater than one second
	if (counter >= room_speed * 1) {
		
		// Draw the tooltip
		draw_set_colour(tooltip_colour);
		tooltip_x = x - 20;
		tooltip_y = y;
		draw_roundrect(tooltip_x, tooltip_y, tooltip_x - 250, tooltip_y + 200, false);
		draw_set_colour(-1);
		
	}
} else {
	// Reset counter
	counter = 0;
}