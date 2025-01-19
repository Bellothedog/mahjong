extends Node

var gameWind = ''
var handWind = 0

# Stats for individual players. Numbers = turn order. In single player, the
# player is player 1 and the others are CPU.
var player1 = {
	'Hand Wind' = '',
	'Round Score' = 0,
	'Total Score' = 0,
	'Hand' = []
}
var player2 = {
	'Hand Wind' = '',
	'Round Score' = 0,
	'Total Score' = 0,
	'Hand' = []
}
var player3 = {
	'Hand Wind' = '',
	'Round Score' = 0,
	'Total Score' = 0,
	'Hand' = []
}
var player4 = {
	'Hand Wind' = '',
	'Round Score' = 0,
	'Total Score' = 0,
	'Hand' = []
}

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

# Rect2's of first tile in suit
var suitToRectangle = [
	Rect2(7, 99, 18, 26), # numbers
	Rect2(7, 163, 18, 26), # circles
	Rect2(7, 131, 18, 26), # bamboo
	Rect2(7, 195, 18, 26), # winds
	Rect2(135, 195, 18, 26) # dragons
	
]
