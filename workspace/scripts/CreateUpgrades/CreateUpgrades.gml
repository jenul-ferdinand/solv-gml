/// @func CreateUpgrades

function CreateUpgrades(){
	for (var i = 0; i < array_length(upgrade_creation); i++) {
			
		// Check all stages and check if already exists
		if (total_marks >= upgrade_creation[i] && upgrade[i].inst_id == -1) {
				
			// Create an upgrade and assign its properties
			var yy;
			if (i == 0) { yy = upgrade_y; } 
			else { yy = upgrade[i-1].inst_id.y + sprite_get_height(spr_upgrade_button) + 25; }
					
			var upgrade_instance = instance_create_layer(upgrade_x, yy, "Instances", obj_upgrade);
			upgrade_instance.stage = upgrade_creation[i];
			upgrade_instance.sprite = upgrade[i].sprite;
			upgrade_instance.label = upgrade[i].label;
			upgrade_instance.cost = upgrade[i].cost;
			upgrade_instance.base_cost = upgrade[i].cost;
			upgrade_instance.description = upgrade[i].description;
			upgrade_instance.marks_per_second = upgrade[i].marks_per_second;
			upgrade_instance.question_value = upgrade[i].question_value;
				
			upgrade[i].inst_id = upgrade_instance;
		}
		
	}
}