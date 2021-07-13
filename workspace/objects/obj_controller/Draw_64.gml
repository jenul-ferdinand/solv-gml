#region Debugging
if (keyboard_check_pressed(ord("O"))) { debug_toggle = !debug_toggle; } 
if (debug_toggle) {
	
	// Game information
	var yy = 40;
	draw_text(10, yy, "points: " + string(points));						yy += 15;
	draw_text(10, yy, "value_max: " + string(values_max));				yy += 15;
	draw_text(10, yy, "questions_solved: " + string(questions_solved));	yy += 15;
	draw_text(10, yy, "fps: " + string(fps_real));						yy += 15;
	
	// Bordering line
	draw_line(300, 0, 300, gui_height);
	draw_line(964, 0, 964, gui_height);
}
#endregion 

// Marks
draw_set_halign(fa_center);
draw_set_font(fn_marks);
var marks_string = string(points) + " Marks";
if (points == 1) { marks_string = string(points) + " Mark"; }
else if (points == 0) { marks_string = "No Marks"; }
draw_text(150, 90, string(points) + " Marks");
draw_set_font(-1);

// Question
draw_set_font(fn_question_area);
draw_text(150, 300, string(value1) + " " + symbol[0] + " " + string(value2))
// Answer
draw_set_halign(fa_left);
draw_text(55, 370, "= " + type_string);
draw_set_font(-1);



#region Titlebar Elements

var titlebar_colour = make_color_rgb(24, 24, 24);
draw_set_colour(titlebar_colour);
var titlebar_width = gui_width;
var titlebar_height = 40;
draw_rectangle(0, 0, titlebar_width, titlebar_height, false);
draw_set_colour(-1);
// Dragging titlebar functionality
var display_mousex = display_mouse_get_x();
var display_mousey = display_mouse_get_y();

// If the mouse is in the titlebar space
if (point_in_rectangle(display_mousex, display_mousey, 0, 0, titlebar_width, titlebar_height)) {
	
	// If the user is holding the mouse button and not dragging
	if (mouse_check_button(mb_left)) && (!dragging) {
		
		// Dragging is true
		dragging = true;	
		
		// Difference between mouse and window
		buffer_x = display_mousex - window_get_x();
		buffer_y = display_mousey - window_get_y();
	}
	// If the user is not dragging
	if (!mouse_check_button(mb_left)) {
		
		// Not dragging
		dragging = false;
		
	}
	
	// When dragging	
	if (dragging) {
		// Set the window position and move it in sync with the mouse position
		window_set_position(display_mousex - buffer_x, display_mousey - buffer_y);
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

// Closing the game
if (point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, circle_width/2) && mouse_click) {
	game_end();
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
if (point_in_circle(gui_mouse_x, gui_mouse_y, center_x, center_y, circle_width/2) && mouse_click_release) {
	window_command_run(window_command_minimize);
}

#endregion

// Upgrades heading
draw_set_font(fn_heading);
draw_text(1113, 86, "Upgrades");
draw_set_font(-1);