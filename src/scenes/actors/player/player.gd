extends CharacterBody3D

@export var speed = 5.0
@export var acceleration = 8.0
@export var jump_speed = 40.0
@export var rotation_speed = 20.0
@export var gravity = 5.0

@onready var camera = $Camera
@onready var model = $cat_model

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	get_move(delta)
	move_and_slide()
	rotate_model()

func get_move(delta):
	var input = Input.get_vector("move_left","move_right","move_foward","move_backwards")
	var dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, camera.rotation.y)
	velocity = lerp(velocity, dir * speed, acceleration * delta)
	
	velocity.y -= gravity



#Anim code
func rotate_model():
	if velocity.length() > 0.2:
		var look_direction = Vector2(velocity.z, velocity.x)
		model.rotation.y = look_direction.angle()
