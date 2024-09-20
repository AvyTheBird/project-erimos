extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Get resolution automatically
	var resolution = DisplayServer.window_get_size()
	$SubViewportContainer.size = resolution


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
