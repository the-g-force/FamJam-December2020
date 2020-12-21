extends Control

func _ready():
	Jukebox.play_just_bells()

# warning-ignore:return_value_discarded
func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/TestLevel.tscn")
