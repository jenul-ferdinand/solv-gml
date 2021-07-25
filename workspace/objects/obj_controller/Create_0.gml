randomise(); // Always random game seed

// MadMath Idle

// Global variables
globalvar gui_width, gui_height, total_marks;
gui_width = display_get_gui_width(); // GUI width
gui_height = display_get_gui_height(); // GUI height
total_marks = 0; // Points counting (marks)


arithmetic_type = 0;
arithmetic_string = ["+", "-", "x", "/"];

display_marks = 0; // Displayed points, using lerp to count one by one
display_marks_lerp = 0.3; // Displayed points interpolation amount

char_max = 3; // Maximum amount of characters the user can type into the textbox

values_max = 5; // Random values range
RandomiseValues(values_max) // Get random values

question = -1; // Question to solve

question_value = 1;	// How many points you get from solving a quesion
questions_solved = 0; // How many questions has the user solved

marks_per_second = 0; // Marks per second, a passive effect that adds points per second
marks_per_second_counter = 0; // Counter for executing the marks per second additions

developer_mode = false; // Debug mode (for developer)
debug_display_toggle = false; // Toggle to turn on developer_mode display



// Background
bg_colour = make_color_rgb(28, 27, 31); // The colour of the game background
// Buffers (Make sure there is space between the elements and edge of game window.)
left_windowbuffer = 45;
right_windowbuffer = gui_width - 25;
bottom_windowbuffer = gui_height - 65;
top_windowbuffer = 65;
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
right_seperator_x = 960; // X position of the right side seperator



// Upgrades 
upgrade_x = 990; // X position of the upgrade buttons
upgrade_y = 110; // Y position of the top upgrade
upgrade_gap = 12; // Gap between each of the upgrades vertically
last_upgrade_index = 0; // Last created upgrade index
last_upgrade_ybase = upgrade_y * 5; // Y position of the last upgrade
upgrades_heading_x = gui_width - 266; // X position of the heading for the upgrades area

// Upgrade constructor (Gamemaker has OOP now)
function Upgrade(_sprite, _label, _description, _cost, _marks_per_second, _question_value, _creation) constructor {
	
	// These are shown on the upgrade, telling the user what it is.
	sprite = _sprite;
	label = _label;
	// How many marks does it cost to buy. 
	cost = _cost;
	// Tooltip description
	description = _description;
	
	
	// Benefits of the upgrade
	marks_per_second = _marks_per_second;
	question_value = _question_value;
	
	// How many marks must the user have to create the particular upgrade.
	creation = _creation;
	
	// Instance id variable
	inst_id = -1;
}

// Upgrade list index constants definitions
CreateUpgradeEnum();

// Creating the upgrade structs
upgrade = [
	new Upgrade(	spr_pencil,						"Pencil",					"To do mathematics, you need something to write with.",				/*Cost*/ 15,			/*MPS*/ 0,			/*QV*/ 1,	/*Upgrade Creation*/ 1		),
	new Upgrade(	spr_mathematician,				"Mathematician",			"Mathematicians do maths for a living.",							/*Cost*/ 100,			/*MPS*/ 1,			/*QV*/ 0,	/*Upgrade Creation*/ 4		),
	new Upgrade(	spr_trigonometry,				"Trigonometry",				"Trigonometry is all about triangles",								/*Cost*/ 500,			/*MPS*/ 4,			/*QV*/ 0,	/*Upgrade Creation*/ 6		),	
	new Upgrade(	spr_amphetamine,				"Amphetamine",				"A drug that increases focus and concentration.",					/*Cost*/ 3000,			/*MPS*/ 10,			/*QV*/ 0,	/*Upgrade Creation*/ 8		),
	new Upgrade(	spr_artificial_intelligence,	"Artificial Intelligence",	"Humans played god and made A.I",									/*Cost*/ 10000,			/*MPS*/ 40,			/*QV*/ 0,	/*Upgrade Creation*/ 12		),
	new Upgrade(	spr_quantum_computing,			"Quantum Computing",		"Powerful machines",												/*Cost*/ 40000,			/*MPS*/ 100,		/*QV*/ 0,	/*Upgrade Creation*/ 16		),
	new Upgrade(	spr_space_travel,				"Space Travel",				"Maybe we can find Aliens to help solve the math questions",		/*Cost*/ 200000,		/*MPS*/ 400,		/*QV*/ 0,	/*Upgrade Creation*/ 24		),
	new Upgrade(	spr_time_travel,				"Time Travel",				"Travelling into the future to find the answer to our questions",	/*Cost*/ 1500000,		/*MPS*/ 6666,		/*QV*/ 0,	/*Upgrade Creation*/ 32		),
	new Upgrade(	spr_animal_sacrifice,			"Animal Sacrifice",			"A ritiual sacrificing an animal to solve maths",					/*Cost*/ 123666666,		/*MPS*/ 98765,		/*QV*/ 0,	/*Upgrade Creation*/ 64		),
	new Upgrade(	spr_undead_experiments,			"Undead Experiment",		"Bringing the dead back to life",									/*Cost*/ 3999999999,	/*MPS*/ 999999,		/*QV*/ 0,	/*Upgrade Creation*/ 76		),
	new Upgrade(	spr_nuclear_warefare,			"Nuclear Warefare",			"This isn't about solving maths anymore",							/*Cost*/ 75000000000,	/*MPS*/ 10000000,	/*QV*/ 0,	/*Upgrade Creation*/ 102	),
]

// Scrolling upgrades
scroll_amount = 36; // Speed of the scroll
scroll_down_locked = false; // Boolean for limiting scroll down
scroll_up_locked = false; // Boolean for limiting scroll up