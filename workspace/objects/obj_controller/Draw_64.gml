// Debugging
var yy = 10;
draw_text(10, yy, "points: " + string(points));						yy += 15;
draw_text(10, yy, "value_max: " + string(values_max));				yy += 15;
draw_text(10, yy, "questions_solved: " + string(questions_solved));	yy += 15;
draw_text(10, yy, "fps: " + string(fps_real));						yy += 15;

// Main text area
draw_set_font(fn_main);
draw_text(80, 260, string(value1) + " " + symbol[0] + " " + string(value2)); // Equation
draw_text(80, 350, "= " + type_string); // Answer area
draw_set_font(-1);

// Draw the foreground rectangle
draw_set_colour(make_color_rgb(52, 52, 52));
draw_rectangle(370, 0, gui_width, gui_height, false);
draw_set_colour(-1);