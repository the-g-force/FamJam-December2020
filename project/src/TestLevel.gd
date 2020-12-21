extends Node2D


const TILE : PackedScene = preload("res://src/Tile.tscn")
const PICKUP : PackedScene = preload("res://src/Pickup.tscn")

export var tile_spawn_delay := 1.0
export var tile_speed := 100.0

var was_gap_last_cycle := false

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
	var spawn_tile := randi()%3
	if spawn_tile != 0 or (spawn_tile == 0 and was_gap_last_cycle):
		var Tile:Node2D = TILE.instance()
		Tile.position = Vector2(1024, 400)
		_tiles.add_child(Tile)
		was_gap_last_cycle = false
	elif spawn_tile == 0 and not was_gap_last_cycle:
		was_gap_last_cycle = true
