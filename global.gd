extends Node

var gameWind = ''
var HandWind = ''

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
