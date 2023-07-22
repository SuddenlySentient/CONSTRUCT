shader_type spatial;

render_mode unshaded;

void fragment() {
	vec3 test = vec3(SCREEN_UV.g, 0.5, SCREEN_UV.r);
	ALBEDO = test;
	}
