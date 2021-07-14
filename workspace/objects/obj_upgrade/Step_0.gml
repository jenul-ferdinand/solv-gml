// Assigned functions
mouse_over = position_meeting(mouse_x, mouse_y, self);
mouse_click = mouse_check_button_pressed(mb_left);

// Flash when pressed
if (mouse_over && mouse_click) {
	flash_alpha = 1;
}

// Reduce flash
if (flash_alpha > 0) {
	flash_alpha -= 0.05;
}