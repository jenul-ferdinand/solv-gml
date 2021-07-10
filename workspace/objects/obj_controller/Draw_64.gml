#region Debugging
if (keyboard_check_pressed(ord("O"))) { debug_toggle = !debug_toggle; } 
if (debug_toggle) {
	
	// Game information
	var yy = 10;
	draw_text(10, yy, "points: " + string(points));						yy += 15;
	draw_text(10, yy, "value_max: " + string(values_max));				yy += 15;
	draw_text(10, yy, "questions_solved: " + string(questions_solved));	yy += 15;
	draw_text(10, yy, "fps: " + string(fps_real));						yy += 15;
	
	// Bordering line
	draw_line(300, 0, 300, gui_height);
}
#endregion

// Main text area
draw_set_font(fn_question_area);
draw_text(40, 250, string(value1) + " " + symbol[0] + " " + string(value2))
draw_text(55, 330, "= " + type_string);
draw_set_font(-1);

#region Titlebar area

var titlebar_colour = make_color_rgb(24, 24, 24);
draw_set_colour(titlebar_colour);
var tbar_width = gui_width;
var tbar_height = gui_height;
draw_rectangle(0, 0, gui_width, 40, false);
draw_set_colour(-1);
// Dragging titlebar functionality
var dx = display_mouse_get_x();
var dy = display_mouse_get_y();
if (point_in_rectangle(dx, dy, 0, 0, tbar_width, tbar_height)) {
	if (mouse_check_button(mb_left)) && (!dragging) {
		dragging = true;
		
		buffer_x = dx - window_get_x();
		buffer_y = dy - window_get_y();
	}
	
	if (!mouse_check_button(mb_left)) {
		dragging = false;
	}
	
	if (dragging) {
		window_set_position(dx - buffer_x, dy - buffer_y);
	}
}

// Close button
var circle_x = gui_width-30;
var circle_y = 10;
var sprite = spr_close_icon;
draw_sprite(sprite, 0, circle_x, circle_y);
var circle_width = sprite_get_width(sprite);
var center_x = circle_x + circle_width/2;
var center_y = circle_y + circle_width/2;

// Clicking the button to close the window
var close_collision = point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, circle_width/2);
if (close_collision) {
	if (mouse_click) {
		game_end();
	}
}

// Minimise button
var circle_x = gui_width-60;
var circle_y = 10;
var sprite = spr_minimise_icon;
draw_sprite(sprite, 0, circle_x, circle_y);
var circle_width = sprite_get_width(sprite);
var center_x = circle_x + circle_width/2;
var center_y = circle_y + circle_width/2;

// Clicking the button to minimise the window
var minimise_collision = point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, circle_width/2)
if (minimise_collision) {
	if (mouse_check_button_released(mb_left)) {
		window_command_run(window_command_minimize);
	}
}

#endregion

