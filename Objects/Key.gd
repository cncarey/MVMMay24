extends PickUp

func _ready():
	hurtbox_component.hurt.connect(onPickUp.unbind(1))
	hitbox_component.hit_hurtbox.connect(addKey.unbind(1))
	
func onPickUp():
	if !pickedUp:
		pickedUp = true
		
		addKey()
	
func addKey():	
	var _c = collected.instantiate()
	_c.global_position = global_position
	_c.stream = sound
	get_parent().add_child(_c)
	
	Global.collectedKeys[pickUpId] = true
	Global.keys += 1
	queue_free()
