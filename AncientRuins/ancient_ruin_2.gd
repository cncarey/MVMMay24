extends AncientRuin
@onready var secret_meeting = %SecretMeeting
@onready var treaty = %Treaty
@onready var kingdom_1 = %Kingdom1
@onready var kingdom_2 = %Kingdom2

var R2_SECRETMEETING = "R2_secretMeeting"
var SECRETMEETING = "Secret Meeting"

var R2_TRUSE = "R2_truse"
var TRUSE = "Truse"

var R2_KINGDOM1 = "R2_kingdom1"
var QUEENOFK1 = "Queen of Angaleritania"

var R2_KINGDOM2 = "R2_kingdom2"
var KINGOFTROTLINDOR = "King of Trotlindor"

func _ready():
	super._ready()
	checkClue(R2_SECRETMEETING, SECRETMEETING, secret_meeting)
	checkClue(R2_TRUSE, TRUSE, treaty)
	checkClue(R2_KINGDOM1, QUEENOFK1, kingdom_1)
	checkClue(R2_KINGDOM2, KINGOFTROTLINDOR, kingdom_2)

func _on_secret_meeting():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["There was a secret meeting called."], 
		speachSound,
		self)
	
		addClue({
			"id": R2_SECRETMEETING, 
			"display" : SECRETMEETING, 
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
			"id": R2_TRUSE, 
			"display" : TRUSE, 
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
			"id": R2_KINGDOM1, 
			"display" : QUEENOFK1, 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_1)
			
func _on_kingdom2():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The King of Trotlindor and his royal advisor where there."], 
		speachSound,
		self)
	
		addClue({
			"id": R2_KINGDOM2, 
			"display" : "King of Trotlindor", 
			"part_of_speach": "noun", 
			"options" : []}, kingdom_2)
