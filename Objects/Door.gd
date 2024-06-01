class_name Door
extends Area2D

@export var destination: String
@export var doorId: String
@export var returnDoorId: String
@export var isOpen: bool
@onready var TouchIndicator = $InteractionIndicator
@onready var lock = $lock

@onready var locked_sound = $LockedSound

@export var speachSound : AudioStream
@onready var tb_marker = $TBMarker

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
			else:
				if locked_sound != null:
					locked_sound.play_with_variance()
				if Global.openedDoors.size() <= 0:
					DialougeManager.startDialogue( tb_marker.global_position, 
					["There's got to be a key around here somewhere."], 
					speachSound)
				pass

func goThroughDoor():
	Global.lastLocation = returnDoorId
	goToRoom.emit(destination)
