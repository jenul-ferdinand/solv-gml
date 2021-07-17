draw_self();

// Emoji
draw_sprite(sprite, 0, x + 10, y + 10);

// Label
draw_set_font(fn_upgrade_label);
draw_text(x + sprite_get_width(sprite) + 15, y + 10, label + ": " + string(quantity));
// Cost
draw_set_colour(cost_colour);
draw_text(x + sprite_get_width(sprite) + 15, y + (sprite_get_height(spr_upgrade_button) - 30), + "Price: " + StringThousands(cost));
draw_set_colour(c_white);
draw_set_font(-1);



// Drawing the flash shader
if (flash_alpha > 0) {
	// Set the shader to the flash
	shader_set(sh_flash);
	
	// Draw the sprite of the button with flash alpha and colour
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flash_colour, flash_alpha);
	
	// Reset the shader
	shader_reset();
}

// Darken overlay 
if (total_marks < cost) {
	draw_sprite_ext(spr_upgrade_button, 0, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
}