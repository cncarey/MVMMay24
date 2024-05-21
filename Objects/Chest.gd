class_name Chest
extends HurtboxComponent

@export var state = 1
@export var chestId: String
@export var isOpen: bool
@onready var TouchIndicator = $InteractionIndicator
@onready var open_sound = $OpenSound
@onready var ani = $AnimatedSprite2D

var isTouching : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.openedChests.has(chestId):
		is_invincible = true
		state = 3
		ani.play("opened")
		isOpen = true
	else:	
		ani.play("closed")
		ani.animation_finished.connect(animtionFinished)
		isOpen = false
	pass # Replace with function body.


func chestEntered(body):
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func chestExited(body):
	isTouching = false
	TouchIndicator.hide()
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching:
		if !isOpen:
			state = 2
			Global.openedChests[chestId]= true
	
			if open_sound != null:
				open_sound.play_with_variance()
				
			TouchIndicator.hide()
			ani.play("opening")
	
func animtionFinished():
	match state:
		1:
			pass
		2:
			is_invincible = true
			state = 3
			ani.play("opened")
			#TODO based on the power that was gained display a bit of loar
			pass
		3:
			
			pass
