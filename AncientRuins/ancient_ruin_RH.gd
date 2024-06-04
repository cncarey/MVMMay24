extends AncientRuin
@onready var shadow_man = %ShadowMan
@onready var queen = %Queen
@onready var letter = %Letter
@onready var kingdom_2 = %Kingdom2


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func _on_shadow_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The Shadow Man found the letter."], 
		speachSound,
		self)
		addClue({
			"id": "RRH_shadowMan", 
			"display" : "Shadow Man", 
			"part_of_speach": "pro-noun", 
			"options" : []}, shadow_man)
	pass
	
func _on_queen():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The letter is signed by the queen."], 
		speachSound,
		self)
		addClue({
			"id": "RRH_Queen", 
			"display" : "Queen", 
			"part_of_speach": "pro-noun", 
			"options" : []}, queen)
	pass
	
func _on_letter():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["There is something off about this message."], 
		speachSound,
		self)
		addClue({
			"id": "RRH_Letter", 
			"display" : "letter", 
			"part_of_speach": "noun", 
			"options" : []}, letter)
	pass
	
func _on_kingdom_2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["A letter saying kingdom 1 plans to burn down kingdom 2."], 
		speachSound,
		self)
		addClue({
			"id": "RRH_Kingdom2", 
			"display" : "Kingdom 2", 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_2)
	pass
