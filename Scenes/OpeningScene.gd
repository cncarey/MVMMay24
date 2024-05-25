extends Node2D

const textboxLocation = Vector2(224, 250)
@export var speachSound : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	DialougeManager.finishedDisplaying.connect(startGame)
	DialougeManager.startDialogue(textboxLocation, 
	["As long as I've been alive our kingdoms have always been at peace,",
		"but last night the royal adviser was murdered.",
		"I went to consult the town oracles, but they sent me away.",
		"While I was leaving the head Oracle bumped me!",
		"Then he whispered so only I could hear, \"it's up to you.\"",
		"A note floated to the floor.",
		"It was written in some strange writing that I've only seen outside the labyrinth."
	], speachSound)


func _input(event):
	if event.is_action_pressed("Cancel"):
		startGame()
		
func startGame():
	Global.canPlayerMover = true
	get_tree().change_scene_to_file("res://Scenes/a_scene.tscn")
