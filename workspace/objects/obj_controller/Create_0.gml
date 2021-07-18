randomise(); // Always get random game seed

// MadMath Idle

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


// Seperator
seperator_colour = make_colour_rgb(34, 33, 38);
seperator_width = 6;
right_seperator_x = 960;

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

debug = true; // Debug mode
debug_display_toggle = false; // Toggle to turn on debug display



// Upgrades 
upgrade_x = 990;
upgrade_y = 110;
upgrade_gap = 12;
last_upgrade_ybase = upgrade_y * 5;

// Upgrade class constructor
function Upgrade(_sprite, _label, _description, _cost, _marks_per_second, _question_value) constructor {
	
	// Assign to var
	sprite = _sprite;
	label = _label;
	description = _description;
	cost = _cost;
	marks_per_second = _marks_per_second;
	question_value = _question_value;
	
	// Instance id variable
	inst_id = -1;
}

// Upgrade macros
#macro ARITHMETIC 0
#macro CALCULATOR 1
#macro CALCULUS 2

// Creating the upgrade structs
upgrade = [
	new Upgrade(spr_pencil, "Pencil", "To do mathematics, you need something to write with.", 15, 0, 1),
	new Upgrade(spr_mathematician, "Mathematician", "Mathematicians do maths for a living.", 100, 1, 0),
	new Upgrade(spr_trigonometry, "Trigonometry", "Trigonometry is all about triangles", 500, 4, 0),
	new Upgrade(spr_amphetamine, "Amphetamine", "A drug that increases focus and concentration.", 3000, 10, 0),
	new Upgrade(spr_artificial_intelligence, "Artificial Intelligence", "Humans played god and made A.I", 10000, 40, 0),
	new Upgrade(spr_quantum_computing, "Quantum Computing", "Powerful machines", 40000, 100, 0),
	new Upgrade(spr_space_travel, "Space Travel", "Maybe we can find Aliens to help solve the math questions", 200000, 1, 0),
	new Upgrade(spr_time_travel, "Time Travel", "Travelling into the future to find the answer to our questions", 1500000, 1, 0),
	new Upgrade(spr_animal_sacrifice, "Animal Sacrifice", "A ritiual sacrificing an animal to solve maths", 123666666, 6666, 0),
	new Upgrade(spr_undead_experiments, "Undead Experiment", "Bringing the dead back to life", 3999999999, 999999, 0),
	new Upgrade(spr_nuclear_warefare, "Nuclear Warefare", "This isn't about solving maths anymore", 75000000000, 10000000, 0),
]

// Points upgrade_creation
upgrade_creation[ARITHMETIC] = 1;
upgrade_creation[CALCULATOR] = 2;
upgrade_creation[CALCULUS] = 3;
for (var i = 3; i < array_length(upgrade); i++) { upgrade_creation[i] = 3; }

// Scrolling upgrades
scroll_amount = 36;
scroll_down_locked = false;
scroll_up_locked = false;