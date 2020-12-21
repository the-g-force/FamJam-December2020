extends Area2D

onready var sprite := $Sprite


func _ready():
	var animations := []
	for animation in sprite.frames.get_animation_names():
		animations.append(animation)
	var anim_index := randi()%animations.size()
	var anim:String = animations[anim_index]
	sprite.play(anim)
