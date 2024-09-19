extends Node3D

var camera_active = false

@export var sensivity = 0.0005
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("right_click")):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			camera_active = true
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		camera_active = false

func _input(event):
	if camera_active:
		if event is InputEventMouseMotion:
			rotate_y(rad_to_deg(-event.relative.x * sensivity))
			$SpringArm3D.rotate_x(rad_to_deg(-event.relative.y * sensivity))
