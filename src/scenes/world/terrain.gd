extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var heightmap = get_surface_override_material(0).get("shader_param/noise_tex")
	create_collision()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_collision():
	pass

# YOU STILL NEED TO CREATE COLLISION
