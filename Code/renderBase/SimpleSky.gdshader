shader_type sky;

uniform vec3 skyColor : source_color;
uniform vec3 voidColor : source_color;

void sky() {
	float cal = clamp((EYEDIR.y * 1.5) + (1.0 / 3.0), 0, 1);
	vec3 finalColor = mix(voidColor, skyColor, cal);
	COLOR = finalColor;
}
