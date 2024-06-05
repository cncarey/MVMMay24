class_name Ruin
extends HurtboxComponent

@export var RuinId : String
var isTouching : bool = false
@onready var TouchIndicator = $InteractionIndicator

@export var ancientRuinPopup: PackedScene

signal OpenPopUp(popup)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ruinEntered(body):
	if !Global.openedChests.has("AntientRuins"): return
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func ruinExited(body):
	if !Global.openedChests.has("AntientRuins"): return
	isTouching = false
	TouchIndicator.hide()
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching && Global.canPlayerMover:
		if ancientRuinPopup != null:
			var _ar = ancientRuinPopup.instantiate()
			OpenPopUp.emit(_ar)
			pass
