randomise();

// Global variables
GlobalVariables();

display_marks = 0;
display_marks_lerp = 0.3;

symbol[0] = "+";
symbol[1] = "x";
symbol[2] = "/";

str_max = 2;

// Randomise values
values_max = 5;
RandomiseValues(values_max)

question_value = 1;
questions_solved = 0;
questions_upgrade = 5;

marks_per_second = 0;
marks_per_second_counter = 0;

debug_toggle = false;

#region GUI Elements

leftmost = 45;
rightmost = gui_width - 25;
topmost = 65;

// Upgrades heading
upgrades_heading_x = gui_width - 266;

// Titlebar
dragging = false;
titlebar_colour = make_color_rgb(24, 24, 24);
titlebar_width = gui_width;
titlebar_height = 40;

close_button_x = titlebar_width - 30;
close_button_y = 10;
close_button_sprite = spr_close_icon;

minimise_button_x = titlebar_width - 60;
minimise_button_y = 10;
minimise_button_sprite = spr_minimise_icon;

titlebar_button_width = sprite_get_width(close_button_sprite);
#endregion

// Upgrades 
upgrade_x = 990;
upgrade_y = 130;

// Upgrade class constructor
function Upgrade(_label, _cost, _marks_per_second, _question_value) constructor {
	
	// Assign to var
	label = _label;
	cost = _cost;
	marks_per_second = _marks_per_second;
	question_value = _question_value;
	
	// Instance id variable
	instance_identity = -1;
}

// Upgrade macros
#macro SIMPLE_ARITHMETIC 0
#macro FUNCTIONS 1
#macro CALCULUS 2

// Creating the upgrade structs
upgrade[SIMPLE_ARITHMETIC] = new Upgrade("Simple Arithmetic", 4, 0, 1);
upgrade[FUNCTIONS] = new Upgrade("Functions", 6, 1, 0);
upgrade[CALCULUS] = new Upgrade("Calculus", 8, 10, 0);

// Points upgrade_stage
upgrade_stage[SIMPLE_ARITHMETIC] = 1;
upgrade_stage[FUNCTIONS] = 2;
upgrade_stage[CALCULUS] = 3; 
