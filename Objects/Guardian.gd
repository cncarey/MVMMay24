class_name Guardian
extends HurtboxComponent

const gold = "_gold"
const purple = "_purple"

@export var GuardianId : String

@onready var gem_gold = $GemGold
@onready var gem_purple = $GemPurple
@onready var TouchIndicator = $InteractionIndicator

@onready var tb_marker = $TBMarker

@export var powerUpName : String
@export var powerUpTitle : String
@export var powerUpImage : Texture
@export var powerUpButton : Texture
@export var powerUpDescription: String

@export var speachSound : AudioStream

var powerUp = preload("res://UI/PowerUpModal.tscn")
var isTouching : bool = false

signal OpenPopUp(popup)

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
	if Input.is_action_just_pressed("Interact") && isTouching && Global.canPlayerMover:
		var tbText = handleTBText()
		if tbText.size() >= 1:
			DialougeManager.startDialogue( tb_marker.global_position, 
			tbText, 
			speachSound)
		
		if !Global.guardianStatuses.has(GuardianId + gold):
			if Global.tryTakeGemsGold(1):
				Global.guardianStatuses[GuardianId + gold] = true
				gem_gold.show()
		if !Global.guardianStatuses.has(GuardianId + purple):
			if Global.tryTakeGemsPurple(1):
				Global.guardianStatuses[GuardianId + purple] = true
				gem_purple.show()
				
		if Global.guardianStatuses.has(GuardianId + gold) and Global.guardianStatuses.has(GuardianId + purple) && Global.canPlayerMover:
			#TODO if it's not in the list screenshake
			Global.openedChests[powerUpName] = true
			Global.canPlayerMover = false
			var _powerUp = powerUp.instantiate()
			
			_powerUp.powerUpTitle = powerUpTitle
			_powerUp.powerUpImage = powerUpImage
			_powerUp.powerUpButton = powerUpButton
			_powerUp.powerUpDescription = powerUpDescription
			OpenPopUp.emit(_powerUp)
			pass

func handleTBText() -> Array[String]:
	var gemCount = maxi(Global.gems_gold, 0) + maxi(Global.gems_purple, 0)
	match Global.guardianStatuses.size():
		1:
			if  gemCount <= 0:
				return ["I guess I have to find the other one."]
			else:
				return [] #stay empty
		0:
			if  gemCount >= 2:
				return [] #stay empty
			elif  gemCount >= 1:
				return ["Here's where this goes.", "I guess I have to find the other one."]
			else:
				return ["I wonder what goes in these hole."]
		_:
			return [] #stay empty
			
	
