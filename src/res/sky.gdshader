shader_type sky;

uniform vec3 skyColor: source_color;
uniform vec3 horizonColor: source_color;

void sky() {
	float color = clamp(EYEDIR.y / .2, 0.0, 1.0);
	COLOR = mix(horizonColor, skyColor, color);
}
