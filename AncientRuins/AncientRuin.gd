class_name AncientRuin
extends CanvasLayer


const textboxLocation = Vector2(224, 250)
@export var speachSound : AudioStream
var isPlaying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DialougeManager.finishedDisplaying.connect(textFininshed)
	pass #

func textFininshed():
	isPlaying = false
	
func onClose():
	#TODO emit the close if we need to
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
