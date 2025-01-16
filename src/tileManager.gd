extends Node2D

# to be emitted when hand state changes
signal updateHand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.suits = [
		['1n', '2n', '3n', '4n', '5n', '6n', '7n', '8n', '9n'], # numbers
		['1c', '2c', '3c', '4c', '5c', '6c', '7c', '8c', '9c'], # circles
		['1b', '2b', '3b', '4b', '5b', '6b', '7b', '8b', '9b'], # bamboo
		['Ew', 'Sw', 'Ww', 'Nw'], # winds
		['Wd', 'Gd', 'Rd'], # dragons
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Fill tiles array with 4 of every suit, remove dead wall and determine dora
func loadTiles() -> void:
	for suit in Global.suits:
		for n in 3:
			Global.tiles = Global.tiles + suit
	Global.tiles.shuffle() # Shuffle the tiles (duh)
	Global.tiles.shuffle() # Once more for good measure
	
	Global.deadWall = Global.tiles.slice(121, 135) # Make last 14 tiles the dead wall
	for tile in range(13): # Remove the dead wall
		Global.tiles.remove(121)
	
	for suit in Global.suits:
		var suitIndex = Global.suit.find(Global.deadWall[0]) # attempt to find dora indicator
		if suitIndex != -1: # if find() did not return not found
			Global.dora = Global.deadWall[suitIndex + 1]
			break
		

# Deal 13 tiles to each player, one extra for East hand
func dealTiles() -> void:
	for n in 12:
		Global.eastHand.append(Global.tiles[0])
		Global.tiles.pop(0)
		Global.southHand.append(Global.tiles[0])
		Global.tiles.pop(0)
		Global.westHand.append(Global.tiles[0])
		Global.tiles.pop(0)
		Global.northHand.append(Global.tiles[0])
		Global.tiles.pop(0)
	Global.eastHand.append(Global.tiles[0])
	Global.tiles.pop(0)
	updateHand.emit()
