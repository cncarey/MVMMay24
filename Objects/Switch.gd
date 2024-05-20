class_name Switch
extends HurtboxComponent

@export var switchId: String
@onready var ani = $AnimatedSprite2D

@onready var TouchIndicator = $InteractionIndicator
var isTouching : bool = false
var isOn : bool = false

signal switchToggled(isOn)

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.foundSwitches.has(switchId):
		if Global.switchStatuses.has(switchId):
			setSwitchStatus(Global.switchStatuses[switchId])

func setSwitchStatus(status: bool):
	isOn = status
	Global.switchStatuses[switchId]= status
	if status:
		ani.play("on")
	else:
		ani.play("off")
	
func isNotIntractable():
	is_invincible = true
	ani.hide()

func isIntractable():
	is_invincible = false
	ani.show()
	
func switchEntered(body):
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func switchExited(body):
	isTouching = false
	TouchIndicator.hide()
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching:
		setSwitchStatus(!isOn)
		switchToggled.emit(isOn)
