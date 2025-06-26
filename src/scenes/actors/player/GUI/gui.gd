extends Control

func _process(_delta):
	ToggleInventory()

#Show/Hide inventory
func ToggleInventory():
	if Input.is_action_just_pressed("inventory"):
		$InvGUI.visible = !$InvGUI.visible
