extends AncientRuin

@onready var kingdom_1 = %Kingdom1
@onready var kingdom_2 = %Kingdom2
@onready var over_fishing = %OverFishing
@onready var river = %River

var R1_KINGDOM2 = "R1_kingdom2"
var TROTLINDOR = "Trotlindor"

var R1_KINGDOM1 = "R1_kingdom1"
var KINGDOM1 = "Angaleritania"

var R1_RIVER = "R1_river"
var RIVER = "River"

var R1_OVERFISHING = "R1_overfishing"
var OVERFISHING = "Overfishing"

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	checkClue(R1_KINGDOM2, TROTLINDOR, kingdom_2)
	checkClue(R1_KINGDOM1, KINGDOM1, kingdom_1)
	checkClue(R1_RIVER, RIVER, river)
	checkClue(R1_OVERFISHING, OVERFISHING, over_fishing)
	
func _on_boat_2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Those are Trotlindor fishing boats. Why are they in our waters?"],
		speachSound,
		self)
	
		addClue({
			"id": R1_KINGDOM2, 
			"display" : TROTLINDOR, 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdom_2)
	pass # Replace with function body.

func _on_boat():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Those are our fishing boats."],
		speachSound,
		self)
		addClue({
			"id": R1_KINGDOM1, 
			"display" : KINGDOM1, 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdom_1)
	pass 
	
func _on_empty_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Our nets look really empty in our own river."], 
		speachSound,
		self)
		addClue({
			"id": R1_RIVER, 
			"display" : RIVER, 
			"part_of_speach": "noun", 
			"options" : []}, river)
	pass
	
func _on_full_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["They have way more then their share of fish."], 
		speachSound,
		self)
		addClue({
			"id": R1_OVERFISHING, 
			"display" : OVERFISHING, 
			"part_of_speach": "verb", 
			"options" : []}, over_fishing)
	pass

