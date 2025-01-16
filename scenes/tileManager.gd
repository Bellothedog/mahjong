extends Node2D

var tiles = []
var suits = [
		['1n', '2n', '3n', '4n', '5n', '6n', '7n', '8n', '9n'], # numbers
		['1c', '2c', '3c', '4c', '5c', '6c', '7c', '8c', '9c'], # circles
		['1b', '2b', '3b', '4b', '5b', '6b', '7b', '8b', '9b'], # bamboo
		['Ew', 'Sw', 'Ww', 'Nw'], # winds
		['Wd', 'Gd', 'Rd'], # dragons
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Fill suits array with 4 of every suit, creating the full 138-tile set.
func loadTiles() -> void:
	for suit in suits:
		for n in 3:
			tiles = tiles + suit
