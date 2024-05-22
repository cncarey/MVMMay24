class_name Twinkle
extends HurtboxComponent

@export var twinkleId: String
@export var switchId: String

@onready var TouchIndicator = $InteractionIndicator
@onready var touch_sound = $touchSound


@onready var ani = $AnimatedSprite2D

var isTouchingOuter : bool = false
var isTouchingInner : bool = false

signal twinkleFound(switchId)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouchingInner:
		Global.foundTwinkles[twinkleId]= true
		Global.foundSwitches[switchId]= true
		twinkleFound.emit(switchId)
		queue_free()
		

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if !Global.openedChests.has("EchoShard"): return
	if local_shape_index == 0:
		isTouchingOuter = true
		ani.show()
		if touch_sound != null:
			touch_sound.play_with_variance()
			
	if local_shape_index == 1:
		isTouchingInner = true
		TouchIndicator.show()


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if !Global.openedChests.has("EchoShard"): return
	if local_shape_index == 0:
		isTouchingOuter = false
		ani.hide()
		#TODO leave sound
	if local_shape_index == 1:
		isTouchingInner = false
		TouchIndicator.hide()
