extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	DialougeManager.finishedDisplaying.connect(finishGame)
	DialougeManager.startNextLine.connect(finishLine)
	pass # Replace with function body.

func finishLine(currentLineId: int):
	
	match currentLineId:
		0:
			pass

func _input(event):
	if event.is_action_pressed("Cancel"):
		finishGame()
		
		
func finishGame():
	Global.canPlayerMover = true
	DialougeManager.finishedDisplaying.disconnect(finishGame)
	DialougeManager.startNextLine.disconnect(finishLine)
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file("res://Menus/MainMenu.tscn")
	LevelTransition.fadeFromBlack()
