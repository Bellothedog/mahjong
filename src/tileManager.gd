extends Node2D

# to be emitted when hand state changes
signal updateHand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tableNode = get_node('..')
	tableNode.tileManagerStart.connect(loadTiles)

# Fill tiles array with 4 of every suit, remove dead wall and determine dora
func loadTiles() -> void:
	for suit in Global.suits:
		for n in 4:
			Global.tiles = Global.tiles + suit
	Global.tiles.shuffle() # Shuffle the tiles (duh)
	Global.tiles.shuffle() # Once more for good measure
	
	Global.deadWall = Global.tiles.slice(121, 135) # Make last 14 tiles the dead wall
	for tile in range(13): # Remove the dead wall
		Global.tiles.remove_at(121)
	
	for suit in Global.suits:
		var suitIndex = suit.find(Global.deadWall[0]) # attempt to find dora indicator
		print(suitIndex)
		if suitIndex != -1: # if find() did not return not found
			Global.dora = Global.deadWall[suitIndex + 1]
			break
		print('Dora: ', Global.dora)
	dealTiles()
		

# Deal 13 tiles to each player, one extra for East hand
func dealTiles() -> void:
	for n in 12:
		Global.player1['Hand'].append(Global.tiles[0])
		Global.tiles.remove_at(0)
		Global.player2['Hand'].append(Global.tiles[0])
		Global.tiles.remove_at(0)
		Global.player3['Hand'].append(Global.tiles[0])
		Global.tiles.remove_at(0)
		Global.player4['Hand'].append(Global.tiles[0])
		Global.tiles.remove_at(0)
	for player in [Global.player1, Global.player2, Global.player3, Global.player4]:
		if player['Hand Wind'] == 'Ew':
			Global.player['Hand'].append(Global.tiles[0])
			Global.tiles.remove_at(0)
	updateHand.emit()
