class_name Door
extends Area2D

@export var destination: String
@export var doorId: String
@export var returnDoorId: String
@export var isOpen: bool
@onready var TouchIndicator = $InteractionIndicator
@onready var lock = $lock

var isTouching : bool = false

signal goToRoom(_destination)

# Called when the node enters the scene tree for the first time.
func _ready():
	#check the global for the state of the door
	if !isOpen:
		isOpen = Global.openedDoors.has(doorId)
		
	if !isOpen:
		lock.show()
	
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
			goThroughDoor()
		else:
			#check if you have a key and unlock the door
			if Global.tryTakeKeys(1):
				lock.hide()
				Global.openedDoors[doorId] = true
				goThroughDoor()
			pass

func goThroughDoor():
	Global.lastLocation = returnDoorId
	goToRoom.emit(destination)
