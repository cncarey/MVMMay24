extends PickUp

enum _gemType {gold, purple}

@export var gemType : _gemType
@export var speachSound : AudioStream

func _ready():
	hurtbox_component.hurt.connect(onPickUp.unbind(1))
	hitbox_component.hit_hurtbox.connect(addGem.unbind(1))
	
	
	if gemType == _gemType.gold:
		ani.play("gold")
	if gemType == _gemType.purple:
		ani.play("purple")
	pass # Replace with function body.

func onPickUp():
	if !pickedUp:
		pickedUp = true
		
		addGem()
	
func addGem():	
	match Global.collectedGems.size():
		0:
			DialougeManager.startDialogue( tb_marker.global_position, 
			["Is this what the orical sent me to get?",
			"I've never seen something so beautiful.",	
			"I wonder if there are more down here."], 
			speachSound)
		1:
			if Global.guardianStatuses.size()  <=0:
				DialougeManager.startDialogue( tb_marker.global_position, 
				["Now I just need to figure out where to put you."], 
				speachSound)
			else:
				DialougeManager.startDialogue( tb_marker.global_position, 
				["Let me take you back to that statue."], 
				speachSound)
			
	var _c = collected.instantiate()
	_c.global_position = global_position
	get_parent().add_child(_c)
		
	Global.collectedGems[pickUpId] = true
	if gemType == _gemType.gold:
		Global.gems_gold += 1
	if gemType == _gemType.purple:
		Global.gems_purple += 1
		
	queue_free()
