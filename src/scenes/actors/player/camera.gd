extends Node3D

var camera_active = false
@export var sensivity = 0.0001
@export var player = NodePath()
@export var lerp_speed = 14.0
@export var vertical_lerp_speed = 6.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$SpringArm.spring_length = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("right_click")):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			camera_active = true
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		camera_active = false
	
	if(Input.is_action_just_pressed("wheel_up")):
		$SpringArm.spring_length -= 0.5
	if(Input.is_action_just_pressed("wheel_down")):
		$SpringArm.spring_length += 0.5
	$SpringArm.spring_length = clamp($SpringArm.spring_length, 2, 10)


func _physics_process(delta):
	interpolate_camera(delta)


func _input(event):
	if camera_active:
		if event is InputEventMouseMotion:
			rotate_y(rad_to_deg(-event.relative.x * sensivity))
			$SpringArm.rotate_x(rad_to_deg(-event.relative.y * sensivity))
			$SpringArm.rotation.x = clamp($SpringArm.rotation.x,deg_to_rad(-80), deg_to_rad(5))


func interpolate_camera(delta):
	var target = get_node(player)
	 # If there's no target, don't do anything
	if !target:
		return
	position.x = lerp(position.x, target.position.x, lerp_speed * delta)
	position.z = lerp(position.z, target.position.z, lerp_speed * delta)
	position.y = lerp(position.y, target.position.y, vertical_lerp_speed * delta)
