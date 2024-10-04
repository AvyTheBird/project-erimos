extends Node

var inv_slot = load("res://src/scenes/actors/player/item_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Open/Close inventory
	if Input.is_action_just_pressed("inventory"):
		$Inventory/Panel.visible = !$Inventory/Panel.visible
