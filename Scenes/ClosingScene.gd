extends Node2D

const textboxLocation = Vector2(224, 250)
@export var speachSound : AudioStream
@onready var animation_player = $AnimationPlayer
@onready var canvas_layer = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("RESET")
	DialougeManager.finishedDisplaying.connect(finishGame)
	DialougeManager.startNextLine.connect(finishLine)
	DialougeManager.startDialogue(textboxLocation, 
	["I think I know what happened!",
		"The war started over a fishing dispute.",
		"The two sides tried to find peace",
		"but, another kingdom was making too much money selling the them weapons.",
		"They would do anything to stay rich.",
		"A wizard gave them the jewels of peace and the kingdoms stayed at peace for may year.",
		"The Shadow man started plotting his regenge.",
		"He tried to start a new war and frame the queen.",
		"When that didn't work, he tried to steal the gems!",
		"But he was caught by the royal advisor.",
		"SO HE MURDERED HIM!"
	], speachSound,
	canvas_layer)

func finishLine(currentLineId: int):
	
	match currentLineId:
		0:
			pass
		1:
			animation_player.play("boat")
			pass
		2:
			animation_player.play("peace")
			pass
		3:
			animation_player.play("weapons")
			pass
		4:
			animation_player.play("gold")
			pass
		5:
			animation_player.play("wizardGem")
			pass
		6:	
			animation_player.play("shadowMan")
			pass
		7: 
			animation_player.play("framed")
			pass
		8: 
			animation_player.play("steal")
			pass
		9: 
			animation_player.play("royalAdvisor")
			pass
		10:
			animation_player.play("murder")
			pass
		_:
			animation_player.play("RESET")
			pass
		

func _input(event):
	if event.is_action_pressed("Cancel"):
		finishGame()
		
		
func finishGame():
	Global.canPlayerMover = true
	DialougeManager.finishedDisplaying.disconnect(finishGame)
	DialougeManager.startNextLine.disconnect(finishLine)
	#await timer 1.5 seconds
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
	LevelTransition.fadeFromBlack()
