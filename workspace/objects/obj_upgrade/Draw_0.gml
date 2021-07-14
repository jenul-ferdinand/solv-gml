draw_self();

draw_set_font(fn_upgrade_label);
draw_text(x, y, string(cost) + " " + label);
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