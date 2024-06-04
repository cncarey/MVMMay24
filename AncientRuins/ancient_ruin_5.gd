extends AncientRuin

@onready var shadow_man = %ShadowMan
@onready var royal_advisor = %RoyalAdvisor
@onready var gem = %Gem
@onready var steal = %Steal

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func _on_shadow_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The shadow man saw snooping around in the laberith."], 
		speachSound,
		self)
		addClue({
			"id": "R5_shadowMan", 
			"display" : "Shadow Man", 
			"part_of_speach": "pro-noun", 
			"options" : []}, shadow_man)
	pass
	
func _on_royal_advisor():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The roayl advisor was doing his rounds in the laberith."], 
		speachSound,
		self)
		addClue({
			"id": "R5_royalAdvisor", 
			"display" : "Royal Advisor", 
			"part_of_speach": "pro-noun", 
			"options" : []}, royal_advisor)
	pass
	
func _on_gems():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The gems of peace are abandoned in the corner.", "Why would someone have moved them here."], 
		speachSound,
		self)
		addClue({
			"id": "R5_gems", 
			"display" : "Gems", 
			"part_of_speach": "noun", 
			"options" : []}, gem)
	pass

func _on_stealing():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The gems of peace are not in the statuse where they are suppose to be.", "Did someone steal them?"], 
		speachSound,
		self)
		addClue({
			"id": "R5_stealing", 
			"display" : "Stealing", 
			"part_of_speach": "verb", 
			"options" : []}, steal)
	pass
