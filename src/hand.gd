extends Node2D

const PATH_TO_TILE_SCENE = "res://scenes/tile.tscn"
var tile = preload(PATH_TO_TILE_SCENE)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tableNode = get_node('../tileManager')
	tableNode.updateHand.connect(updateHand)

func loadTileRectangle() -> Rect2:
	var suitOfTile = 0
	var indexInSuit = 0
	for suit in Global.suits:
		indexInSuit = suit.find(Global.player1['Hand'][0])
		if indexInSuit != -1:
			suitOfTile = Global.suits.find(suit)
	var rect:Rect2 = Global.suitToRectangle[suitOfTile]
	var tilePos = 7*indexInSuit
	rect = rect.merge(Rect2(0,tilePos,0,0))
	return rect

func updateHand():
	var tileInstance = tile.instantiate()
	loadTileRectangle()
	tileInstance.region_rect = Rect2(0,0,0,0)
	add_child(tileInstance)
	
	
