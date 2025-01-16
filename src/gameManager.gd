extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gameWind = Global.suits[3].pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
