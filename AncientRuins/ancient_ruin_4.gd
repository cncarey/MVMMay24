extends AncientRuin
@onready var wizard = %Wizard
@onready var spell = %Spell
@onready var kingdoms = %Kingdoms
@onready var gems = %Gems

var R4_WIZARD = "R4_Wizard"
var WIZARD = "Wizard"

var R4_SPELL = "R4_Spell"
var ENCHANTED = "Enchanted"

var R4_KINGDOMS = "R4_Kingdoms"
var BOTHKINGDOMS = "Both Kingdoms"

var R4_GEMS = "R4_Gems"
var GEMS = "Gems"
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	checkClue(R4_WIZARD, WIZARD, wizard)
	checkClue(R4_SPELL, ENCHANTED, spell)
	checkClue(R4_KINGDOMS, BOTHKINGDOMS, kingdoms)
	checkClue(R4_GEMS, GEMS, gems)

func _on_wizard():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["That is one powerful wizard."], 
		speachSound,
		self)
	
		addClue({
			"id": R4_WIZARD, 
			"display" : WIZARD, 
			"part_of_speach": "pro-noun", 
			"options" : []}, wizard)

func _on_spell():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["These gems have special powers."], 
		speachSound,
		self)
	
		addClue({
			"id": R4_SPELL, 
			"display" : ENCHANTED, 
			"part_of_speach": "verb", 
			"options" : []}, spell)

func _on_kingdoms():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["It looks like there's one for each kingdom."], 
		speachSound,
		self)
	
		addClue({
			"id": R4_KINGDOMS, 
			"display" : BOTHKINGDOMS, 
			"part_of_speach": "pro-noun", 
			"options" : []}, kingdoms)
			
func _on_gems():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["They are so beautiful; I feel at peace."], 
		speachSound,
		self)
	
		addClue({
			"id": R4_GEMS, 
			"display" : GEMS, 
			"part_of_speach": "noun", 
			"options" : []}, gems)
