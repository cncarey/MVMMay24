extends Node

var lastLocation: String
var openedDoors : Dictionary = {}
var collectedKeys : Dictionary = {}


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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

