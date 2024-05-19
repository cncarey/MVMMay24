extends Node

var lastLocation: String
var openedDoors : Dictionary = {}
var openedChests : Dictionary = {}
var collectedKeys : Dictionary = {}
var collectedGems : Dictionary = {}


@export var keys = 0 : 
	set(value):
		keys = value
		# Signal out that the health has changed
		keys_changed.emit(keys)
	get:
		return keys
	
func tryTakeKeys(dec: int) -> bool:
	if keys - dec < 0:
		return false
	else:
		keys -= dec
		return true

signal keys_changed(keys)

@export var gems_gold = 0 : 
	set(value):
		gems_gold = value
		# Signal out that the health has changed
		gems_gold_changed.emit(gems_gold)
	get:
		return gems_gold
	
func tryTakeGemsGold(dec: int) -> bool:
	if gems_gold - dec < 0:
		return false
	else:
		gems_gold -= dec
		return true

signal gems_gold_changed(gem_gold)

@export var gems_purple = 0 : 
	set(value):
		gems_purple = value
		# Signal out that the health has changed
		gems_purple_changed.emit(gems_purple)
	get:
		return gems_purple
	
func tryTakeGemsPurple(dec: int) -> bool:
	if gems_purple - dec < 0:
		return false
	else:
		gems_purple -= dec
		return true

signal gems_purple_changed(gems_purple)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

