randomise(); // Always get random game seed

// Global variables
globalvar gui_width, gui_height, total_marks;
gui_width = display_get_gui_width(); // GUI width
gui_height = display_get_gui_height(); // GUI height
total_marks = 0; // Points counting (marks)


#region GUI Elements

// Background
bg_colour = make_color_rgb(28, 27, 31); // Game background colour

// Buffers
left_windowbuffer = 45;
right_windowbuffer = gui_width - 25;
bottom_windowbuffer = gui_height - 65;
top_windowbuffer = 65;

// Upgrades heading
upgrades_heading_x = gui_width - 266;

// Titlebar
dragging = false;
titlebar_colour = make_color_rgb(24, 24, 24);
titlebar_width = gui_width;
titlebar_height = 40;
// Close button
close_button_x = titlebar_width - 30;
close_button_y = 10;
close_button_sprite = spr_close_icon;
// Minimise button
minimise_button_x = titlebar_width - 60;
minimise_button_y = 10;
minimise_button_sprite = spr_minimise_icon;
// Titlebar buttons
titlebar_button_width = sprite_get_width(close_button_sprite);

#endregion

display_marks = 0; // Displayed points, using lerp to count one by one
display_marks_lerp = 0.3; // Displayed points interpolation amount

char_max = 2; // Maximum amount of characters the user can type into the textbox

values_max = 5; // Random values range
RandomiseValues(values_max) // Get random values

question_value = 1;	// How many points you get from solving a quesion
questions_solved = 0; // How many questions has the user solved
questions_upgrade = 5; // How many questions does the user need to solve to progress to the next difficulty (subject to change)

marks_per_second = 0; // Marks per second, a passive effect that adds points per second
marks_per_second_counter = 0; // Counter for executing the marks per second additions

debug_toggle = false; // Toggle to turn on debug mode



// Upgrades 
upgrade_x = 990;
upgrade_y = 110;
last_upgrade_ybase = upgrade_y * 5;

// Upgrade class constructor
function Upgrade(_label, _cost, _marks_per_second, _question_value) constructor {
	
	// Assign to var
	label = _label;
	cost = _cost;
	marks_per_second = _marks_per_second;
	question_value = _question_value;
	
	// Instance id variable
	inst_id = -1;
}

// Upgrade macros
#macro SIMPLE_ARITHMETIC 0
#macro FUNCTIONS 1
#macro CALCULUS 2

// Creating the upgrade structs
upgrade = [
	new Upgrade("Arithmetic", 4, 0, 1),
	new Upgrade("Functions", 6, 1, 0),
	new Upgrade("Calculus", 8, 10, 0),
	new Upgrade("test 1", 10, 1, 1),
	new Upgrade("test 2", 12, 1, 1),
	new Upgrade("test 3", 14, 1, 1),
	new Upgrade("test 4", 16, 1, 1),
	new Upgrade("test 5", 18, 1, 1),
]

// Points upgrade_stage
upgrade_stage[SIMPLE_ARITHMETIC] = 1;
upgrade_stage[FUNCTIONS] = 2;
upgrade_stage[CALCULUS] = 3;
for (var i = 3; i < array_length(upgrade); i++) { upgrade_stage[i] = 3; }

// Scrolling upgrades
scroll_amount = 20;
scroll_down_locked = false;
scroll_up_locked = false;