extends Area2D

onready var sprite := $Sprite

func _ready():
	var image = "FOO"

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
