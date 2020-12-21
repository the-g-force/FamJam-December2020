extends StaticBody2D

func _process(_delta):
	if position.x + $CollisionShape2D.shape.extents.x*2 < 0:
		queue_free()

func _draw():
	var extents:Vector2 = $CollisionShape2D.shape.extents
	draw_rect(Rect2(-extents, extents*2), Color.brown)
