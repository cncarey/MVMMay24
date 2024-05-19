extends Node2D

@onready var doors = $Doors
@onready var keys = $Keys
@onready var gems = $Gems

@onready var key_container = %KeyContainer
@onready var key_sprite = %KeySprite

@onready var mainPlayer = $MainPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	updateKeyContainer(Global.keys)
	Global.keys_changed.connect(updateKeyContainer)
	
	if Global.lastLocation != null || Global.lastLocation != "":
		#for each thing in door if the last location is in the list
		# set the player location to the dooor location
		if doors.get_child_count() > 0:
			for d in doors.get_children():
				var _d = d as Door
				_d.goToRoom.connect(_on_go_to_room)
				#TODO check the Global door stats to see if a closed door should be opened
				if _d.doorId == Global.lastLocation:
					mainPlayer.global_position = _d.global_position
		
		if keys.get_child_count() > 0:
			for k in keys.get_children():
				var _k = k as PickUp
				if Global.collectedKeys.has(_k.pickUpId):
				# if it's in the collected keys free it 
					_k.queue_free()
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_go_to_room(_destination):
	get_tree().paused = true
	if _destination == null: # || !(_destination is FileAccess):
		return
		
	await LevelTransition.fadeToBlack()
	
	get_tree().paused = false
	get_tree().change_scene_to_file(_destination)
	await LevelTransition.fadeFromBlack()
	pass # Replace with function body.


func updateKeyContainer(keys:int):
	key_container.columns = maxi(keys, 1)
	for kc in key_container.get_children():
		kc.free()
		
	for i in range(keys):
		var k :TextureRect = key_sprite.duplicate()
		
		k.visible = true
		key_container.add_child(k)
		pass
	
