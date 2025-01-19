extends Node2D

signal tileManagerStart

# Choose random game wind, assign hand winds to all players
func _ready() -> void:
	Global.gameWind = Global.suits[3].pick_random()
	Global.player1['Hand Wind'] = Global.suits[3].pick_random()
	var handWind = Global.suits[3].find(Global.player1['Hand Wind'])
	Global.player4['Hand Wind'] = Global.suits[3][handWind - 1]
	Global.player3['Hand Wind'] = Global.suits[3][handWind - 2]
	Global.player2['Hand Wind'] = Global.suits[3][handWind - 3]
	tileManagerStart.emit()
