extends CharacterBody3D

@export var speed = 8.0
@export var acceleration = 8.0
@export var jump_speed = 20.0
@export var rotation_speed = 20.0
@export var gravity = 1.0
@export var camera = NodePath()

@onready var model = $cat_model

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	get_move(delta)
	move_and_slide()
	rotate_model()

func get_move(delta):
	var input = Input.get_vector("move_left","move_right","move_foward","move_backwards")
	var dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, get_node(camera).rotation.y)
	velocity = lerp(velocity, dir * speed, acceleration * delta)
	
	velocity.y -= gravity
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y += jump_speed


#Anim code
func rotate_model():
	if Input.get_vector("move_left","move_right","move_foward","move_backwards") != Vector2(0,0):
		var look_direction = Vector2(velocity.z, velocity.x)
		model.rotation.y = look_direction.angle()
