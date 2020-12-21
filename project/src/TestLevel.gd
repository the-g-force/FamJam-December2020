extends Node2D


const TILE : PackedScene = preload("res://src/Tile.tscn")

export var tile_spawn_delay := 1.0
export var tile_speed := 200.0


var was_gap_last_cycle := false

var _progress : float = 0
var _until_next_tile := 0

var _tile_sequence := 0

onready var _TILE_WIDTH = $Tiles/Tile.width()
onready var _tiles := $Tiles

func _ready():
	randomize()


func _process(delta):
	_progress += tile_speed * delta
	_until_next_tile -= tile_speed * delta
	if _until_next_tile <= 0:		
		if _tile_sequence == 2:
			_tile_sequence = 0
		else:
			var new_tile = TILE.instance()
			new_tile.position.x = 1000 + _until_next_tile
			_tiles.add_child(new_tile)
			_tile_sequence += 1
			
		_until_next_tile += _TILE_WIDTH
		
	
	for tile in _tiles.get_children():
		tile.position.x -= tile_speed*delta

