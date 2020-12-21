extends Node2D


const TILE : PackedScene = preload("res://src/Tile.tscn")

export var tile_spawn_delay := 1.0
export var tile_speed := 100.0

var tile_height_increments := [200, 300, 400, 500]

onready var _timer := $Timer
onready var _tiles := $Tiles

func _ready():
	randomize()
	_timer.start(tile_spawn_delay)


func _process(delta):
	for tile in _tiles.get_children():
		if tile.position.x > 0:
			tile.position.x -= tile_speed*delta
		else:
			tile.queue_free()


func _on_Timer_timeout():
	var tile_height_index = randi()%tile_height_increments.size()
	var tile_height = tile_height_increments[tile_height_index]
	var Tile = TILE.instance()
	Tile.position = Vector2(1024, tile_height)
	_tiles.add_child(Tile)
