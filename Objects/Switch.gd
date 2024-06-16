class_name Switch
extends HurtboxComponent

@export var switchId: String
@export var switchText: String
@onready var ani = $AnimatedSprite2D
@onready var platform_label = $PlatformLabel
@onready var switch_sound = $SwitchSound
@onready var platform_sound = $platformSound

@onready var TouchIndicator = $InteractionIndicator
var isTouching : bool = false
var isOn : bool = false

signal switchToggled(isOn)

# Called when the node enters the scene tree for the first time.
func _ready():
	if platform_label!= null:
		platform_label.text = switchText
	if Global.foundSwitches.has(switchId):
		if Global.switchStatuses.has(switchId):
			setSwitchStatus(Global.switchStatuses[switchId])

func setSwitchStatus(status: bool):
	isOn = status
	
	Global.setSwitchStatuses(switchId, status)
	if status:
		is_invincible = true
		ani.play("on")
	else:
		ani.play("off")
	
func isNotIntractable():
	is_invincible = true
	ani.hide()
	platform_label.hide()

func isIntractable():
	is_invincible = false
	ani.show()
	platform_label.show()
	
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
		switch_sound.play()
		platform_sound.play()
		switchToggled.emit(isOn)
		is_invincible = true
