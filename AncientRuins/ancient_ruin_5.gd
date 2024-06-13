extends AncientRuin

@onready var shadow_man = %ShadowMan
@onready var royal_advisor = %RoyalAdvisor
@onready var gem = %Gem
@onready var steal = %Steal

var R5_SHADOWMAN = "R5_shadowMan"
var SHADOWMAN = "Shadow Man"

var R5_ROYALADVISOR = "R5_royalAdvisor"
var ROYALADVISOR = "Royal Advisor"

var R5_GEMS = "R5_gems"
var GEMS = "Gems"

var R5_STEALING = "R5_stealing"
var STEALING = "Stealing"
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	checkClue(R5_SHADOWMAN, SHADOWMAN, shadow_man)
	checkClue(R5_ROYALADVISOR, ROYALADVISOR, royal_advisor)
	checkClue(R5_GEMS, GEMS, gem)
	checkClue(R5_STEALING, STEALING, steal)

func _on_shadow_man():
	if isPlaying: return
	
	else:
		isPlaying = true
		DialougeManager.startDialogue(textbox_marker.global_position, 
		["The shadow man saw snooping around in the laberith."], 
		speachSound,
		self)
		addClue({
			"id": R5_SHADOWMAN, 
			"display" : SHADOWMAN, 
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
			"id": R5_ROYALADVISOR, 
			"display" : ROYALADVISOR, 
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
			"id": R5_GEMS, 
			"display" : GEMS, 
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
			"id": R5_STEALING, 
			"display" : STEALING, 
			"part_of_speach": "verb", 
			"options" : []}, steal)
	pass
