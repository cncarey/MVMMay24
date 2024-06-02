class_name AncientRuin
extends CanvasLayer

@onready var textbox_marker = $TextboxMarker


@export var speachSound : AudioStream
var isPlaying = false

signal onRuinClose()
# Called when the node enters the scene tree for the first time.
func _ready():
	DialougeManager.finishedDisplaying.connect(textFininshed)
	pass #

func textFininshed():
	isPlaying = false
	
func onClose():
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
