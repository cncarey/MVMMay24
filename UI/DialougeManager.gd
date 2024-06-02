extends Node

@onready var textBoxScene = preload("res://UI/Textbox.tscn")

var diaglogLines : Array[String] = []
var currentLineIndex: int = 0

var textBox 
var textBoxPosition : Vector2

var parent
var sfx : AudioStream

var isActive : bool = false
var canAdvanceNextLine : bool = false

func startDialogue(position: Vector2, lines : Array[String], speechSfx: AudioStream, _parent = get_tree().current_scene):
	if isActive:
		return
		
	textBoxPosition = position
	diaglogLines = lines
	sfx = speechSfx
	parent = _parent
	
	showTextBox()
	isActive= true
	Global.canPlayerMover = false
	
	pass

func showTextBox():
	textBox = textBoxScene.instantiate()
	textBox.connect("finishedDisplaying", textBoxOnFinishDisaplay)
	parent.add_child(textBox)
	textBox.global_position = textBoxPosition
	textBox.displayText(diaglogLines[currentLineIndex], sfx)
	canAdvanceNextLine = false
	startNextLine.emit(currentLineIndex)
	
signal finishedDisplaying()
signal startNextLine(currentLineIndex)
	
func textBoxOnFinishDisaplay():
	canAdvanceNextLine = true
	
func _unhandled_input(event):
	if event.is_action_pressed("Accept") && isActive && canAdvanceNextLine:
		textBox.queue_free()
		
		currentLineIndex += 1
		if currentLineIndex >= diaglogLines.size():
			resetTB()
			finishedDisplaying.emit()
			return
		else:
			showTextBox()
			
	if event.is_action_pressed("Cancel") && isActive:
		resetTB()
		textBox.queue_free()	

func resetTB():
	isActive = false
	Global.canPlayerMover = true
	currentLineIndex = 0
