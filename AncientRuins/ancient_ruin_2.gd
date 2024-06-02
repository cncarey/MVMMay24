extends AncientRuin
@onready var secret_meeting = %SecretMeeting
@onready var treaty = %Treaty
@onready var kingdom_1 = %Kingdom1
@onready var kingdom_2 = %Kingdom2

func _ready():
	super._ready()

func _on_secret_meeting():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["There was a secret meeting called."], 
		speachSound,
		self)
	
		addClue({
			"id": "R2_secretMeeting", 
			"display" : "Secret Meeting", 
			"part_of_speach": "noun", 
			"options" : []}, secret_meeting)

func _on_truse():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Everyone was tired of fighting and wanted peace."], 
		speachSound,
		self)
	
		addClue({
			"id": "R2_truse", 
			"display" : "Truse", 
			"part_of_speach": "noun", 
			"options" : []}, treaty)

func _on_kingdom1():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The queen and the royal advisor where there."], 
		speachSound,
		self)
	
		addClue({
			"id": "R2_kingdom1", 
			"display" : "Queen of k1", 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_1)
			
func _on_kingdom2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The King and his royal advisor where there."], 
		speachSound,
		self)
	
		addClue({
			"id": "R2_kingdom2", 
			"display" : "King of k2", 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_2)
