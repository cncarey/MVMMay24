extends CanvasLayer
@onready var kingdom_waters = %KingdomWaters
@onready var kingdom_2 = %Kingdom2
@onready var over_fishing = %OverFishing
@onready var label_4 = %Label4

const textboxLocation = Vector2(224, 250)
@export var speachSound : AudioStream
var isPlaying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DialougeManager.finishedDisplaying.connect(textFininshed)
	pass # Replace with function body.

func textFininshed():
	isPlaying = false
	
func onClose():
	#TODO emit the close if we need to
	DialougeManager.finishedDisplaying.disconnect(textFininshed)
	queue_free()

func _on_boat_2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Those are ___ fishing boats. Why are they in our waters?"], speachSound)
	
	#TODO add clue to the list
	pass # Replace with function body.


func _on_boat():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Those are our fishing boats."], speachSound)
	
	pass 
	
func _on_empty_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Our nets look really empty."], speachSound)
	
	pass
	
func _on_full_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Those are our fishing boats."], speachSound)
	
	pass
