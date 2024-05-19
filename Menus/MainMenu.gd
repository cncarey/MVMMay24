extends Control
@onready var new_game = %NewGame
@onready var _continue = %Continue
@onready var options = %Options
@onready var quit = %Quit
@onready var main_container = $MainContainer
@onready var options_container = $OptionsContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game.grab_focus()
	if Global.currentLocation == "":
		_continue.hide()
	else:
		new_game.text = "New Game"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_start_pressed():
	Global.resetGame()
	await LevelTransition.fadeToBlack()
	#TODO go to the opening cut scene
	get_tree().change_scene_to_file("res://Scenes/a_scene.tscn")
	LevelTransition.fadeFromBlack()
	pass # Replace with function body.

func _on_continue_pressed():
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file(Global.currentLocation)
	LevelTransition.fadeFromBlack()
	pass 

func hideOptions():
	main_container.show()
	options_container.hide()
	
func showOptions():
	main_container.hide()
	options_container.show()

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

