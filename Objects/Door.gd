class_name Door
extends Area2D

@export var destination: String
@export var doorId: String
@export var returnDoorId: String
@export var isOpen: bool
@onready var TouchIndicator = $InteractionIndicator


var isTouching : bool = false

signal goToRoom(_destination)

# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO check the global for the state of the door
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func doorEntered(body):
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func doorExited(body):
	isTouching = false
	TouchIndicator.hide()
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching:
		if isOpen:
			Global.lastLocation = returnDoorId
			goToRoom.emit(destination)
		else:
			#check if you have a key and unlock the door
			pass
