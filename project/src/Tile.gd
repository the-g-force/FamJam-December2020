extends StaticBody2D

signal tile_entered

func _process(_delta):
	if position.x + $CollisionShape2D.shape.extents.x*2 < 0:
		queue_free()


func width()->float:
	return 100.0


func _on_TileEnterArea_body_entered(_body):
	emit_signal("tile_entered")
