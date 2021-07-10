randomise();

// Global variables
globalvar gui_width, gui_height;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

symbol[0] = "+";
symbol[1] = "x";
symbol[2] = "/";

type_string = "";
str_max = 2;

// Pick random integer values for the two numbers being added.
values_max = 5;
value1 = irandom_range(1, values_max);
value2 = irandom_range(1, values_max);

points = 0;
question_value = 1;
questions_solved = 0;
questions_upgrade = 5;

debug_toggle = false;

// Titlebar
dragging = false;