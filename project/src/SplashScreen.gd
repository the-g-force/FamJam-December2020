extends Control

# warning-ignore:return_value_discarded
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		get_tree().change_scene("res://src/MenuScreen.tscn")
		
