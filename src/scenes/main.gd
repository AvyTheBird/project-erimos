extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Get resolution automatically
	var resolution = DisplayServer.window_get_size()
	$SubViewportContainer.size = resolution
