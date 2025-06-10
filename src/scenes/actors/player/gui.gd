extends Node

var inv_slot = load("res://src/scenes/actors/player/inv_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#Open/Close inventory
	if Input.is_action_just_pressed("inventory"):
		$Inventory/InvPanel.visible = !$Inventory/InvPanel.visible
