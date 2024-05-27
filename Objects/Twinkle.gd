class_name Twinkle
extends HurtboxComponent

@export var twinkleId: String
@export var switchId: String

@onready var TouchIndicator = $InteractionIndicator
@onready var touch_sound = $touchSound

enum _signDirection {LeftDown, LeftMiddle, LeftUp, RightDown, RightMiddle, RightUp}
@export var signDirection : _signDirection
@onready var sign : AnimatedSprite2D = %Sign


@onready var ani = $AnimatedSprite2D

var isTouchingOuter : bool = false
var isTouchingInner : bool = false

signal twinkleFound(switchId)
# Called when the node enters the scene tree for the first time.
func _ready():
	match signDirection:
		_signDirection.LeftDown:
			sign.play("LeftDown")
		_signDirection.LeftMiddle:
			sign.play("LeftMiddle")
		_signDirection.LeftUp:
			sign.play("LeftUp")
		_signDirection.RightDown:
			sign.play("RightDown")
		_signDirection.RightMiddle:
			sign.play("RightMiddle")
		_signDirection.RightUp:
			sign.play("RightUp")
	pass # Replace with function body.


func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouchingInner:
		Global.foundTwinkles[twinkleId]= true
		Global.foundSwitches[switchId]= true
		var _sign = sign.duplicate()
		get_tree().current_scene.add_child(_sign)
		_sign.global_position = sign.global_position
		_sign.visible = true
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
