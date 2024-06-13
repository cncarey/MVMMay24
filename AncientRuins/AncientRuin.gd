class_name AncientRuin
extends CanvasLayer

@onready var textbox_marker = $TextboxMarker


@export var speachSound : AudioStream
var isPlaying = false

signal onRuinClose()
# Called when the node enters the scene tree for the first time.
func _ready():
	if DisplayServer.mouse_get_mode() != DisplayServer.MOUSE_MODE_VISIBLE:
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	
	DialougeManager.finishedDisplaying.connect(textFininshed)
	pass #

func textFininshed():
	isPlaying = false
	
func onClose():
	if DisplayServer.mouse_get_mode() != DisplayServer.MOUSE_MODE_HIDDEN:
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	
	onRuinClose.emit()
	DialougeManager.resetTB()
	DialougeManager.finishedDisplaying.disconnect(textFininshed)
	queue_free()

func addClue(clue, label: Label):
	if clue != null && clue.has("display"):
		label.text = clue["display"]
	
	if clue != null && clue.has("id"):
		if !Global.foundClues.has(clue["id"]):
			Global.foundClues[clue["id"]] = clue
	# id, display text, part of speach
	pass
	
func checkClue(clueId: String, value: String, label: Label):
	if Global.foundClues.has(clueId):
		label.text = value
