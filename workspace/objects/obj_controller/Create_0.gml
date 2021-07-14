randomise();

// Global variables
GlobalVariables();

symbol[0] = "+";
symbol[1] = "x";
symbol[2] = "/";

type_string = "";
str_max = 2;

// Pick random integer values for the two numbers being added.
values_max = 5;
value1 = irandom_range(1, values_max);
value2 = irandom_range(1, values_max);

question_value = 1;
questions_solved = 0;
questions_upgrade = 5;

debug_toggle = false;

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

// Upgrades 
upgrade_x = 990;

// Points upgrade_stage
upgrade_stage[0] = 1;
upgrade_stage[1] = 2;
upgrade_stage[2] = 3;

// Upgrade class constructor
function Upgrade(_label, _cost) constructor {
	label = _label;
	cost = _cost;
	instance_identity = -1;
}

// Upgrade macros
#macro SIMPLE_ARITHMETIC 0
#macro FUNCTIONS 1
#macro CALCULUS 2

// Creating the upgrade structs
upgrade[SIMPLE_ARITHMETIC] = new Upgrade("Simple Arithmetic", 10);
upgrade[FUNCTIONS] = new Upgrade("Functions", 15);
upgrade[CALCULUS] = new Upgrade("Calculus", 20);
