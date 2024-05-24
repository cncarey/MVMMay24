class_name Chest
extends HurtboxComponent

@export var state = 1
@export var chestId: String
@export var isOpen: bool

@export var powerUpTitle : String
@export var powerUpImage : Texture
@export var powerUpButton : Texture
@export var powerUpDescription: String

@onready var TouchIndicator = $InteractionIndicator
@onready var open_sound = $OpenSound
@onready var ani = $AnimatedSprite2D
@onready var scale_component = $ScaleComponent
#@onready var shake_component = $ShakeComponent

var powerUp = preload("res://UI/PowerUpModal.tscn")

var isTouching : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.openedChests.has(chestId):
		state = 3
		ani.play("opened")
		isOpen = true
	else:	
		ani.play("closed")
		ani.animation_finished.connect(animtionFinished)
		isOpen = false

func chestEntered(body):
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func chestExited(body):
	isTouching = false
	TouchIndicator.hide()
	pass

signal OpenPopUp(popup)
func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching && Global.canPlayerMover:
		if !isOpen:
			isOpen = true
			state = 2
			scale_component.tween_scale()
			#shake_component.tween_shake()
			
			Global.openedChests[chestId]= true
	
			if open_sound != null:
				open_sound.play_with_variance()
				
			TouchIndicator.hide()
			ani.play("opening")
			
		Global.canPlayerMover = false
		var _powerUp = powerUp.instantiate()
		
		_powerUp.powerUpTitle = powerUpTitle
		_powerUp.powerUpImage = powerUpImage
		_powerUp.powerUpButton = powerUpButton
		_powerUp.powerUpDescription = powerUpDescription
		OpenPopUp.emit(_powerUp)
		
	
func animtionFinished():
	match state:
		1:
			pass
		2:
			state = 3
			ani.play("opened")
			pass
		3:
			
			pass
