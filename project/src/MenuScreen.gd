extends Control

onready var _full_screen_toggle := $mainscreen/FullScreenToggle

func _ready():
	Jukebox.play_just_bells()
	_full_screen_toggle.pressed = OS.window_fullscreen


# warning-ignore:return_value_discarded
func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/TestLevel.tscn")


func _on_FullScreenToggle_pressed():
	OS.window_fullscreen = not OS.window_fullscreen
