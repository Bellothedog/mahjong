extends Node2D

const PATH_TO_TILE_SCENE = "res://scenes/tile.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tile = preload(PATH_TO_TILE_SCENE)
	var tableNode = ('.')
	tableNode.updateHand.connect(updateHand)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateHand():
	pass # TODO: render current hand state by instantiating the tile node
