extends Node2D

const INITIAL_TILES := 8
const Tile : PackedScene = preload("res://src/Tile.tscn")
const TileGenerationTrigger : PackedScene = preload("res://src/TileGenerationTrigger.tscn")

var _tile_index := 0

onready var _tiles := $Tiles

func _ready():
	for x in range(0,1100,100):
		_run_tile_generator(x)


func _run_tile_generator(x:float)->void:
	# The initial run of tiles is always there
	if _tile_index <= INITIAL_TILES:
		_create_tile_at(x)
		
	# Then potentially make a tile, based on the generation algorithm
	elif (_tile_index - INITIAL_TILES)%3>0:
		_create_tile_at(x)
		
	# Whether we made a tile or not, drop a trigger than will make a new tile when necessary
	var trigger := TileGenerationTrigger.instance()
	trigger.position.x = x
	var _ignored := trigger.connect("body_entered", self, "_on_TileGenerationTrigger_entered", [trigger], CONNECT_ONESHOT)
	_tiles.add_child(trigger)
	
	_tile_index += 1


# warning-ignore:return_value_discarded
func _create_tile_at(x:float)->void:
	var new_tile := Tile.instance()
	new_tile.position.x = x
	_tiles.add_child(new_tile)	


func _on_TileGenerationTrigger_entered(_body, trigger:Node2D):
	call_deferred("_run_tile_generator", trigger.position.x + 900)
	trigger.queue_free()


