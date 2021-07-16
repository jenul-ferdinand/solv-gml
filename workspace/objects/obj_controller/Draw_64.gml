#region Debugging
if (keyboard_check_pressed(ord("O"))) { debug_toggle = !debug_toggle; } 
if (debug_toggle) {
	
	// Game information
	var yy = 40;
	draw_text(10, yy, "total_marks: " + string(total_marks));						yy += 15;
	draw_text(10, yy, "value_max: " + string(values_max));				yy += 15;
	draw_text(10, yy, "questions_solved: " + string(questions_solved));	yy += 15;
	draw_text(10, yy, "fps: " + string(fps_real));						yy += 15;
	
	// Bordering line
	draw_line(300, 0, 300, gui_height);
	draw_line(964, 0, 964, gui_height);
}
#endregion 

// Marks
draw_set_halign(fa_left);
draw_set_font(fn_marks);
var marks_converted = StringThousands(round(display_marks));
var marks_string = marks_converted + " Marks";
if (total_marks == 1) { marks_string = marks_converted + " Mark"; }
else if (total_marks == 0) { marks_string = "No Marks"; }
else { marks_string = marks_converted + " Marks"; } 
draw_text(left_windowbuffer, top_windowbuffer, marks_string);
draw_set_font(-1);

// Question Value
draw_set_font(fn_question_value);
draw_text(left_windowbuffer, top_windowbuffer + 45, "Question Value: " + string(question_value));
draw_text(left_windowbuffer, top_windowbuffer + 70, "Marks Per Second: " + string(marks_per_second));
draw_set_font(-1);

// Question
draw_set_font(fn_question_area);
draw_text(left_windowbuffer, 300, string(value1) + " + " + string(value2))
// Answer
draw_set_halign(fa_left);
draw_text(left_windowbuffer, 370, "= " + keyboard_string);
draw_set_font(-1);

#region TITLEBAR
// Draw the titlebar background
draw_set_colour(titlebar_colour);
draw_rectangle(0, 0, titlebar_width, titlebar_height, false);
draw_set_colour(-1); 

// Dragging titlebar functionality
var display_mousex = display_mouse_get_x();
var display_mousey = display_mouse_get_y();
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 0, titlebar_width, titlebar_height)) {
	
	// If the user is holding the mouse button and not dragging
	if (mouse_check_button(mb_left)) && (!dragging) {
		
		dragging = true;	
		
		buffer_x = display_mousex - window_get_x();
		buffer_y = display_mousey - window_get_y();
	}
	
	// If the user is not dragging
	if (!mouse_check_button(mb_left)) {
		dragging = false;
	}
}
// When dragging	
if (dragging) {
	window_set_position(display_mousex - buffer_x, display_mousey - buffer_y);
}

// Close button
draw_sprite(close_button_sprite, 0, close_button_x, close_button_y);
var center_x = close_button_x + titlebar_button_width/2;
var center_y = close_button_y + titlebar_button_width/2;
// Closing the game
if (point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, titlebar_button_width/2) && mouse_click) {
	game_end();
}

// Minimise button
draw_sprite(minimise_button_sprite, 0, minimise_button_x, minimise_button_y);
var center_x = minimise_button_x + sprite_get_width(minimise_button_sprite)/2;
var center_y = minimise_button_y + sprite_get_width(minimise_button_sprite)/2;
// Minimising the window
if (point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, titlebar_button_width/2) && mouse_click_release) {
	window_command_run(window_command_minimize);
}

#endregion

// Rectangle to hide the buttons when they are scrolled up
draw_set_colour(bg_colour);
draw_rectangle(upgrade_x, titlebar_height, upgrade_x + sprite_get_width(spr_upgrade_button), upgrade_y, false);
draw_set_colour(-1);

// Upgrades heading
draw_set_font(fn_heading);
draw_text(upgrades_heading_x, top_windowbuffer, "Upgrades");
draw_set_font(-1);