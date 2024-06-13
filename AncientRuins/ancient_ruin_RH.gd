extends AncientRuin
@onready var shadow_man = %ShadowMan
@onready var queen = %Queen
@onready var letter = %Letter
@onready var kingdom_2 = %Kingdom2

var RRH_SHADOWMAN = "RRH_shadowMan"
var SHADOWMAN = "Shadow Man"

var RRH_QUEEN = "RRH_Queen"
var QUEEN = "Queen"

var RRH_LETTER = "RRH_Letter"
var LETTER = "Letter"

var RRH_KINGDOM2 = "RRH_Kingdom2"
var TROTLINDOR = "Trotlindor"
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	checkClue(RRH_SHADOWMAN, SHADOWMAN, shadow_man)
	checkClue(RRH_QUEEN, QUEEN, queen)
	checkClue(RRH_LETTER, LETTER, letter)
	checkClue(RRH_KINGDOM2, TROTLINDOR, kingdom_2)

func _on_shadow_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The Shadow Man found the letter."], 
		speachSound,
		self)
		addClue({
			"id": RRH_SHADOWMAN, 
			"display" : SHADOWMAN, 
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
			"id": RRH_QUEEN, 
			"display" : QUEEN, 
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
			"id": RRH_LETTER, 
			"display" : LETTER, 
			"part_of_speach": "noun", 
			"options" : []}, letter)
	pass
	
func _on_kingdom_2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["A letter saying Angaleritania plans to burn down Trotlindor."], 
		speachSound,
		self)
		addClue({
			"id": RRH_KINGDOM2, 
			"display" : TROTLINDOR, 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_2)
	pass
