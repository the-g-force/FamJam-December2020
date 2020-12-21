extends AudioStreamPlayer


onready var JINGLE_BELLS := preload("res://assets/jingle_jangle.ogg")
onready var JUST_BELLS := preload("res://assets/just_bells.ogg")

func play_just_bells():
	stream = JUST_BELLS
	play()


func play_music():
	stream = JINGLE_BELLS
	play()
