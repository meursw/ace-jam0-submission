shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

// Called for every pixel the material is visible on.
void fragment() {
	vec4 screen_texture = texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR = vec4(0.0, screen_texture.b, 0.0, 0.5);
}
