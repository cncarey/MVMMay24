extends PickUp

enum _gemType {gold, purple}

@export var gemType : _gemType

func _ready():
	hurtbox_component.hurt.connect(onPickUp.unbind(1))
	hitbox_component.hit_hurtbox.connect(addGem.unbind(1))
	super._ready()
	
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
	Global.collectedGems[pickUpId] = true
	if gemType == _gemType.gold:
		Global.gems_gold += 1
	if gemType == _gemType.purple:
		Global.gems_purple += 1
		
	queue_free()
