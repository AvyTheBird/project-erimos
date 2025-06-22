extends CharacterBody3D

@export var speed = 6.0
@export var acceleration = 6.0
@export var jump_speed = 10.0
@export var rotation_speed = 20.0
@export var gravity = .8
@export var camera = NodePath()

@onready var model = $cat_model

func _physics_process(delta):
	get_move(delta)
	move_and_slide()
	rotate_model()

func get_move(delta):
	#Makes player walk in the direction of the 2D vector set by move keys.
	var input = Input.get_vector("move_left","move_right","move_foward","move_backwards")
	var dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, get_node(camera).rotation.y)
	#Interpolates X and Z separately so it doesn't affect gravity (y-axis).
	#Makes movement smooth.
	velocity.x = lerp(velocity.x, dir.x * speed, acceleration * delta)
	velocity.z = lerp(velocity.z, dir.z * speed, acceleration * delta)
	
	if is_on_floor():
		#Set y to 0 to stop a weird bug with move_and_slide
		#that makes character jitter when walking
		velocity.y = 0
		if Input.is_action_just_pressed("jump"):
			velocity.y += jump_speed
	else:
		velocity.y -= gravity
		print(velocity.y)


#Animation code. Self explanatory.
func rotate_model():
	if Input.get_vector("move_left","move_right","move_foward","move_backwards") != Vector2(0,0):
		var look_direction = Vector2(velocity.z, velocity.x)
		model.rotation.y = look_direction.angle()
