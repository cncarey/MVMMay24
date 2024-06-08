extends Node2D

const textboxLocation = Vector2(224, 250)
@export var speachSound : AudioStream
@onready var animation_player = $AnimationPlayer
@onready var canvas_layer = $CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("0_castles")
	DialougeManager.finishedDisplaying.connect(startGame)
	DialougeManager.startNextLine.connect(finishLine)
	DialougeManager.startDialogue(textboxLocation, 
	["As long as I've been alive our kingdoms have always been at peace,",
		"but last night the royal adviser was murdered.",
		"I went to consult the town oracles, but they sent me away.",
		"While I was leaving the head Oracle bumped me!",
		"Then he whispered so only I could hear, \"it's up to you.\"",
		"A note floated to the floor.",
		"It was written in some strange writing that I've only seen outside the labyrinth."
	], speachSound,
	canvas_layer)


#func _input(event):
#	if event.is_action_pressed("Cancel"):
#		startGame()

func finishLine(currentLineId: int):
	
	match currentLineId:
		0:
			animation_player.play("0_castles")
		1:
			animation_player.play("1_murder")	
		2:
			animation_player.play("2_temple")
		3:
			animation_player.play("3_bump")
		4:
			animation_player.play("4_whisper")
		5:
			animation_player.play("5_Scroll")
		6:
			animation_player.play("6_OpenScroll")
	pass		
		
func startGame():
	Global.canPlayerMover = true
	DialougeManager.finishedDisplaying.disconnect(startGame)
	DialougeManager.startNextLine.disconnect(finishLine)
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file("res://Scenes/a_scene.tscn")
	LevelTransition.fadeFromBlack()
