extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	var extents:Vector2 = $CollisionShape2D.shape.extents
	draw_rect(Rect2(-extents, extents*2), Color.brown)
