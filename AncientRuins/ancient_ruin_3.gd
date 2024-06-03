extends AncientRuin
@onready var shadow_man = %ShadowMan
@onready var money = %Money
@onready var weapons = %Weapons
@onready var kingdoms = %Kingdoms


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


func _on_shadown_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["That's who runs all the weapons sales in __, the Shadow Man."], 
		speachSound,
		self)
	
		addClue({
			"id": "R3_shadowMan", 
			"display" : "Shadow Man", 
			"part_of_speach": "pro-noun", 
			"options" : []}, shadow_man)
			
func _on_money():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["This is a really wealthy kingdom."], 
		speachSound,
		self)
	
		addClue({
			"id": "R3_Money", 
			"display" : "Wealthy", 
			"part_of_speach": "adjetive", 
			"options" : []}, money)
			
func _on_weapons():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["They are the only arms dealers for a two month journey."], 
		speachSound,
		self)
	
		addClue({
			"id": "R3_weapons", 
			"display" : "Weapons", 
			"part_of_speach": "noun", 
			"options" : []}, weapons)
			
func _on_kindgoms():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Both kingdoms talk with the ___ regularly."], 
		speachSound,
		self)
	
		addClue({
			"id": "R3_Both", 
			"display" : "Both Kingdoms", 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdoms)
