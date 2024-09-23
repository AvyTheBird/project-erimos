shader_type sky;

uniform vec3 SkyColor: source_color;

void sky() {
	COLOR = SkyColor;
}
