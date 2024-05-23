extends Control

@onready var power_up_title = %PowerUpTitle
@onready var power_up_image = %PowerUpImage
@onready var button_icons = %ButtonIcons
@onready var power_up_description = %PowerUpDescription

@export var powerUpTitle : String
@export var powerUpImage : Texture
@export var powerUpButton : Texture
@export var powerUpDescription: String

# Called when the node enters the scene tree for the first time.
func _ready():
	if powerUpTitle != null:
		power_up_title.text = powerUpTitle
		
	if powerUpImage != null:
		power_up_image.texture = powerUpImage
		
	if powerUpButton != null:
		button_icons.texture = powerUpButton
		
	if powerUpDescription != null:
		power_up_description.text
	
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		Global.canPlayerMover = true
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
