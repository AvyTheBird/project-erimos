shader_type spatial;

uniform sampler2D noise_tex;
uniform float cut_factor;
uniform float border;
uniform float height;

uniform sampler2D albedo_1;


void vertex() {
	float noise = texture(noise_tex, UV).r;
	noise = smoothstep(cut_factor, cut_factor+border, noise);
	VERTEX.y += noise*height;
}

void fragment() {
	vec2 uv_1 = UV * 6.0;
	ALBEDO = vec3(texture(albedo_1, uv_1).rgb);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
