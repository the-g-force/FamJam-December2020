extends Node2D


const TILE : PackedScene = preload("res://src/Tile.tscn")

var _last_placement = 0

onready var _TILE_WIDTH = 100
onready var _tiles := $Tiles
onready var _elf := $Elf

func _ready():
	for x in range(0,1100,100):
		_create_tile_at(x)
		
# warning-ignore:return_value_discarded
func _create_tile_at(x:float)->void:
	var new_tile := TILE.instance()
	new_tile.position.x = x
	_tiles.add_child(new_tile)
	new_tile.connect("tile_entered", self, "_on_Tile_entered", [new_tile], CONNECT_ONESHOT)
		
func _on_Tile_entered(tile:Node2D):
	call_deferred("_create_tile_at", tile.position.x + 900)
