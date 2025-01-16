extends Node2D

var tiles = []
var deadWall = []
var suits = [
		['1n', '2n', '3n', '4n', '5n', '6n', '7n', '8n', '9n'], # numbers
		['1c', '2c', '3c', '4c', '5c', '6c', '7c', '8c', '9c'], # circles
		['1b', '2b', '3b', '4b', '5b', '6b', '7b', '8b', '9b'], # bamboo
		['Ew', 'Sw', 'Ww', 'Nw'], # winds
		['Wd', 'Gd', 'Rd'], # dragons
	]
var dora = ''

var eastHand = []
var southHand = []
var westHand = []
var northHand = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Fill tiles array with 4 of every suit, remove dead wall and determine dora
func loadTiles() -> void:
	for suit in suits:
		for n in 3:
			tiles = tiles + suit
	tiles.shuffle() # Shuffle the tiles (duh)
	tiles.shuffle() # Once more for good measure
	
	deadWall = tiles.slice(121, 135) # Make last 14 tiles the dead wall
	for tile in range(13): # Remove the dead wall
		tiles.remove(121)
	
	for suit in suits:
		var suitIndex = suit.find(deadWall[0]) # attempt to find dora indicator
		if suitIndex != -1: # if find() did not return not found
			dora = deadWall[suitIndex + 1]
			break
		

# Deal 13 tiles to each player, one extra for East hand
func dealTiles() -> void:
	for n in 12:
		eastHand.append(tiles[0])
		tiles.pop(0)
		southHand.append(tiles[0])
		tiles.pop(0)
		westHand.append(tiles[0])
		tiles.pop(0)
		northHand.append(tiles[0])
		tiles.pop(0)
	eastHand.append(tiles[0])
	tiles.pop(0)
