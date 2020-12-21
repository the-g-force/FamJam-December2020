extends Node2D

const INITIAL_TILES := 8
const Tile : PackedScene = preload("res://src/Tile.tscn")
const TileGenerationTrigger : PackedScene = preload("res://src/TileGenerationTrigger.tscn")
const Ornament : PackedScene = preload("res://src/Ornament.tscn")

export var TIME_SCALE_PER_TILE = 0.02
export var upper_variation_limit := 200

var _tile_index := 0

onready var _tiles := $Tiles
onready var _camera := $Camera2D

func _ready():
	randomize()
	GameState.reset()
	Engine.time_scale = 1.0
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
	
	if _tile_index % 5 == 0:
		var ornament := Ornament.instance()
		var ornament_vertical_variation = randi()%upper_variation_limit
		ornament.position.y = -50-ornament_vertical_variation
		ornament.position.x = x
		_ignored = ornament.connect("body_entered", self, "_on_Ornament_entered", [ornament], CONNECT_ONESHOT)
		_tiles.add_child(ornament)


# warning-ignore:return_value_discarded
func _create_tile_at(x:float)->void:
	var new_tile := Tile.instance()
	new_tile.position.x = x
	_tiles.add_child(new_tile)


func _on_TileGenerationTrigger_entered(_body, trigger:Node2D):
	Engine.time_scale += TIME_SCALE_PER_TILE
	call_deferred("_run_tile_generator", trigger.position.x + 900)
	trigger.queue_free()


func _on_Ornament_entered(_body, ornament:Node2D):
	GameState.ornaments.append(ornament)
	ornament.get_parent().call_deferred("remove_child", ornament)


func _process(_delta):
	_camera.position.x = $Elf.position.x + 334
	if $Elf.position.y > 700:
		_game_over()


func _game_over():
	$Elf.queue_free()
	get_tree().change_scene("res://src/EndScreen.tscn")
