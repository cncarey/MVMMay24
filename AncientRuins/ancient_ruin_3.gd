extends AncientRuin
@onready var shadow_man = %ShadowMan
@onready var money = %Money
@onready var weapons = %Weapons
@onready var kingdoms = %Kingdoms

var R3_SHADOWMAN = "R3_shadowMan"
var SHADOWMAN = "Shadow Man"

var R3_MONEY = "R3_Money"
var WEALTHY = "Wealthy"

var R3_WEAPONS = "R3_weapons"
var WEAPONS = "Weapons"

var R3_BOTH = "R3_Both"
var BOTHKINGDOMS = "Both Kingdoms"
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	checkClue(R3_SHADOWMAN, SHADOWMAN, shadow_man)
	checkClue(R3_MONEY, WEALTHY, money)
	checkClue(R3_WEAPONS, WEAPONS, weapons)
	checkClue(R3_BOTH, BOTHKINGDOMS, kingdoms)

func _on_shadown_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["That's who runs all the weapons sales in Avarivalle, the Shadow Man."], 
		speachSound,
		self)
	
		addClue({
			"id": R3_SHADOWMAN, 
			"display" : SHADOWMAN, 
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
			"id": R3_MONEY, 
			"display" : WEALTHY, 
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
			"id": R3_WEAPONS, 
			"display" : WEAPONS, 
			"part_of_speach": "noun", 
			"options" : []}, weapons)
			
func _on_kindgoms():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["Both kingdoms talk with the shadow man regularly."], 
		speachSound,
		self)
	
		addClue({
			"id": R3_BOTH, 
			"display" : BOTHKINGDOMS, 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdoms)
