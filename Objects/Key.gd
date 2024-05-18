extends PickUp

func _ready():
	hurtbox_component.hurt.connect(onPickUp.unbind(1))
	hitbox_component.hit_hurtbox.connect(addKey.unbind(1))
	super._ready()
	pass # Replace with function body.

func onPickUp():
	if !pickedUp:
		pickedUp = true
		
		addKey()
	
func addKey():	
	Global.collectedKeys[pickUpId] = true
	Global.keys += 1
	queue_free()
