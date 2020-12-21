extends Node2D

onready var _ornaments := $Ornaments
onready var _tree_polygon := $TreePolygon

func _ready():
	$Label.text = "You collected %d ornaments" % GameState.ornaments.size()
	for ornament in GameState.ornaments:
			_ornaments.add_child(ornament)			
			var position := _generate_tree_position()
			ornament.position = position


func _generate_tree_position()->Vector2:
	# It is not clear that there's an easy way to do this, so we'll brute force it.
	while true:
		var point := Vector2(rand_range(0,1000), rand_range(0,600))
		if _check(point):
			return point
	# This will never be reached but we need it for the compiler.
	return Vector2.ZERO
	
	
func _check(position)->bool:
	return Geometry.is_point_in_polygon(position, _tree_polygon.polygon)


# warning-ignore:return_value_discarded
func _on_Button_pressed():
	get_tree().change_scene("res://src/TestLevel.tscn")
