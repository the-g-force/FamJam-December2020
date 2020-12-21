extends Node2D


const TILE : PackedScene = preload("res://src/Tile.tscn")

export var tile_spawn_delay := 1.0
export var tile_speed := 200.0


var was_gap_last_cycle := false

var _until_next_tile := 0.0

var _tile_sequence := 0

onready var _TILE_WIDTH = 100
onready var _tiles := $Tiles

func _ready():
	randomize()


func _process(delta):
	_until_next_tile -= tile_speed * delta
	if _until_next_tile <= 0:
#		if _tile_sequence == 2:
#			_tile_sequence = 0
#		else:
		var new_tile = TILE.instance()
		new_tile.position.x = int(1000 + _until_next_tile)
		_tiles.add_child(new_tile)
		_tile_sequence += 1
			
		_until_next_tile += _TILE_WIDTH
		

