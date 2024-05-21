class_name Guardian
extends HurtboxComponent

const gold = "_gold"
const purple = "_purple"

@export var GuardianId : String

@onready var gem_gold = $GemGold
@onready var gem_purple = $GemPurple
@onready var TouchIndicator = $InteractionIndicator

var isTouching : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.guardianStatuses.has(GuardianId + gold):
		gem_gold.show()
	if Global.guardianStatuses.has(GuardianId + purple):
		gem_purple.show()

func guardianEntered(body):
	isTouching = true
	TouchIndicator.show()
	pass # Replace with function body.

func guardianExited(body):
	isTouching = false
	TouchIndicator.hide()
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("Interact") && isTouching:
		if !Global.guardianStatuses.has(GuardianId + gold):
			if Global.tryTakeGemsGold(1):
				Global.guardianStatuses[GuardianId + gold] = true
				gem_gold.show()
		if !Global.guardianStatuses.has(GuardianId + purple):
			if Global.tryTakeGemsPurple(1):
				Global.guardianStatuses[GuardianId + purple] = true
				gem_purple.show()
		pass
