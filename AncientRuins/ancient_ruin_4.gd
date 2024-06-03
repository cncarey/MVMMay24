extends AncientRuin
@onready var wizard = %Wizard
@onready var spell = %Spell
@onready var kingdoms = %Kingdoms
@onready var gems = %Gems


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func _on_wizard():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["."], 
		speachSound,
		self)
	
		addClue({
			"id": "R4_Wizard", 
			"display" : "Wizard", 
			"part_of_speach": "pro-noun", 
			"options" : []}, wizard)

func _on_spell():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["."], 
		speachSound,
		self)
	
		addClue({
			"id": "R4_Spell", 
			"display" : "Enchanted", 
			"part_of_speach": "verb", 
			"options" : []}, spell)

func _on_kingdoms():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["."], 
		speachSound,
		self)
	
		addClue({
			"id": "R4_Lingdoms", 
			"display" : "Both Kingdoms", 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdoms)
			
func _on_gems():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["."], 
		speachSound,
		self)
	
		addClue({
			"id": "R4_Gems", 
			"display" : "Gems", 
			"part_of_speach": "noun", 
			"options" : []}, gems)
