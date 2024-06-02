extends AncientRuin

@onready var kingdom_1 = %Kingdom1
@onready var kingdom_2 = %Kingdom2
@onready var over_fishing = %OverFishing
@onready var river = %River

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func _on_boat_2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Those are ___ fishing boats. Why are they in our waters?"], speachSound)
	
		addClue({"id": "R1_kingdom2", "display" : "Kingdom 2 Name", "part_of_speach": "pro-noun"}, kingdom_2)
	pass # Replace with function body.


func _on_boat():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Those are our fishing boats."], speachSound)
		addClue({"id": "R1_kingdom1", "display" : "Kingdom 1 Name", "part_of_speach": "pro-noun"}, kingdom_1)
	pass 
	
func _on_empty_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["Our nets look really empty in our own river."], speachSound)
		addClue({"id": "R1_river", "display" : "River", "part_of_speach": "noun"}, river)
	pass
	
func _on_full_nets():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textboxLocation, 
		["They have way more then their share of fish."], speachSound)
		addClue({"id": "R1_overfishing", "display" : "Overfishing", "part_of_speach": "verb"}, over_fishing)
	pass

