extends Node2D


func _ready():
	$Label.text = "You collected %d ornaments" % GameState.ornaments.size()

# warning-ignore:return_value_discarded
func _on_Button_pressed():
	get_tree().change_scene("res://src/TestLevel.tscn")
