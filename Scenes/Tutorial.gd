extends Node2D
@onready var left_sprite = $LeftSprite
@onready var right_sprite = $RightSprite
@onready var jump_sprite = $JumpSprite
@onready var pause_sprite = $PauseSprite

@export var controlLayout : ControlLayout 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if controlLayout != null:
		if controlLayout.left != null:
			left_sprite.texture = controlLayout.left
		if controlLayout.right != null:
			right_sprite.texture = controlLayout.right
		if controlLayout.jump != null:
			jump_sprite.texture = controlLayout.jump
		if controlLayout.pauseButton != null:
			pause_sprite.texture = controlLayout.pauseButton
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
