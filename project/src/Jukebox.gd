extends AudioStreamPlayer


onready var JINGLE_BELLS := preload("res://assets/jingle_jangle.ogg")
onready var JUST_BELLS := preload("res://assets/just_bells.ogg")
onready var O_TREE := preload("res://assets/OChristmasTree.ogg")

func play_just_bells():
	stream = JUST_BELLS
	play()


func play_game_music():
	stream = JINGLE_BELLS
	play()


func play_end_music():
	stream = O_TREE
	play()
