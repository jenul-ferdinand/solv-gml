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

// Upgrades 
upgrade_x = 990;
// Upgrade type ** MAYBE USE DS_LIST FOR THIS**
enum UPGRADE_DATA {
	LABEL,
	COST,
}

enum UPGRADE {
	SIMPLE_ARITHMETIC,
	FUNCTIONS,
	CALCULUS,
}

ds_upgrades[UPGRADE_DATA.LABEL, 0] = "Simple Arithmetic";
ds_upgrades[UPGRADE_DATA.LABEL, 1] = "Functions";
ds_upgrades[UPGRADE_DATA.LABEL, 2] = "Calculus";
ds_upgrades[UPGRADE_DATA.COST, 0] = 20;
ds_upgrades[UPGRADE_DATA.COST, 1] = 50;
ds_upgrades[UPGRADE_DATA.COST, 2] = 100;
// Points upgrade_stage
upgrade_stage[0] = 1;
upgrade_stage[1] = 5;
upgrade_stage[2] = 30;
