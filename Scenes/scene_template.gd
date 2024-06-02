extends Node2D
@export var roomName = ""

@onready var doors = $Doors
@onready var keys = $Keys
@onready var gems = $Gems
@onready var twinkles = $Twinkles
@onready var switches = $Switches
@onready var chests = $Chests
@onready var guardians = $Guardians
@onready var ruins = $Ruins

@onready var center_container = %CenterContainer
@onready var pause_menu = $UI/PauseMenu
@onready var pause_sound = %PauseSound
@onready var unpause_sound = $UI/UnpauseSound
@onready var map = %Map
@onready var options_container = %OptionsContainer
@onready var pause_center = $UI/PauseMenu/PauseCenter

@onready var map_button = %MapButton

@onready var key_container = %KeyContainer
@onready var gold_container = %GoldContainer
@onready var purple_container = %PurpleContainer

@onready var key_sprite = %KeySprite
@onready var gold_gem_sprite = %GoldGemSprite
@onready var purple_gem_sprite = %PurpleGemSprite

@onready var in_room_twinkle = $InRoomTwinkle

@onready var mainPlayer = $MainPlayer

@onready var pass_through_sound = $PassThroughSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.process_mode = Node.PROCESS_MODE_WHEN_PAUSED	
	
	Global.currentLocation = get_tree().current_scene.scene_file_path
	Global.visitedRooms[Global.currentLocation]= true
	
	updateKeyContainer(Global.keys)
	updateGoldContainer(Global.gems_gold)
	updatePurpleContainer(Global.gems_purple)
	Global.keys_changed.connect(updateKeyContainer)
	Global.gems_gold_changed.connect(updateGoldContainer)
	Global.gems_purple_changed.connect(updatePurpleContainer)
	
	if Global.lastLocation != null || Global.lastLocation != "":
		#for each thing in door if the last location is in the list
		# set the player location to the dooor location
		if doors.get_child_count() > 0:
			for d in doors.get_children():
				var _d = d as Door
				_d.goToRoom.connect(_on_go_to_room)
				if _d.doorId == Global.lastLocation:
					mainPlayer.global_position = _d.global_position
		
		if keys.get_child_count() > 0:
			for k in keys.get_children():
				var _k = k as PickUp
				if Global.collectedKeys.has(_k.pickUpId):
				# if it's in the collected keys free it 
					_k.queue_free()
					
		if gems.get_child_count() > 0:
			for g in gems.get_children():
				var _g = g as PickUp
				if Global.collectedGems.has(_g.pickUpId):
				# if it's in the collected gem free it 
					_g.queue_free()
					
		if twinkles.get_child_count() > 0:
			for t in twinkles.get_children():
				var _t = t as Twinkle
				if Global.foundTwinkles.has(_t.twinkleId):
					
					var _sign = _t.sign.duplicate()
					get_tree().current_scene.add_child(_sign)
					_sign.visible = true
					_sign.global_position = _t.sign.global_position
					_t.queue_free()
				else:
					if in_room_twinkle != null && Global.openedChests.has("EchoShard"):
						in_room_twinkle.play()
					_t.twinkleFound.connect(_on_twinkle_found)
					
		if switches.get_child_count() > 0:
			for s in switches.get_children():
				var _s = s as Switch
				if !Global.foundSwitches.has(_s.switchId):
					_s.isNotIntractable()
		
		#TODO cycles through all the chests 
		#	  and connect it to the popupDisplay func	
		if chests.get_child_count() > 0:
			for c in chests.get_children():
				var _c = c as Chest
				_c.OpenPopUp.connect(_on_open_pop_up)
		
		if guardians.get_child_count() > 0:
			for g in guardians.get_children():
				var _g = g as Guardian
				_g.OpenPopUp.connect(_on_open_pop_up)
		
		if ruins.get_child_count() > 0:
			for r in ruins.get_children():
				var _r = r as Ruin
				_r.OpenPopUp.connect(_on_open_pop_up)
		
		pass



func _on_go_to_room(_destination):
	get_tree().paused = true
	if _destination == null: # || !(_destination is FileAccess):
		return
		
	await LevelTransition.fadeToBlack()
	
	get_tree().paused = false
	GlobalSound.playTempSound(pass_through_sound)
	#playTempSound
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
		
func updateGoldContainer(gold:int):
	gold_container.columns = maxi(gold, 1)
	for gc in gold_container.get_children():
		gc.free()
		
	for i in range(gold):
		var ggs :TextureRect = gold_gem_sprite.duplicate()
		
		ggs.visible = true
		gold_container.add_child(ggs)
		pass
		
func updatePurpleContainer(purple:int):
	purple_container.columns = maxi(purple, 1)
	for pc in purple_container.get_children():
		pc.free()
		
	for i in range(purple):
		var pgs :TextureRect = purple_gem_sprite.duplicate()
		
		pgs.visible = true
		purple_container.add_child(pgs)
		pass

func _on_twinkle_found(switchId):
	if switches.get_child_count() > 0:
		for s in switches.get_children():
			var _s = s as Switch
			if _s.switchId == switchId:
				_s.isIntractable()
				
func _on_open_pop_up(popup):
	center_container.add_child(popup)

func _input(event):
	if event.is_action_pressed("Pause"):
		pause()
		pause_sound.play()
		
func pause():
	get_tree().paused = !get_tree().paused 
	pause_menu.visible = !pause_menu.visible
	
func resumePressed():
	get_tree().paused = false
	unpause_sound.play()
	pause_menu.visible = !pause_menu.visible
	pass

func openMap():
	if pause_center.get_child_count() > 0:
		for c in pause_center.get_children():
			c.queue_free()
		options_container.show()
		map_button.text = "Map"
	else:
		options_container.hide()
		map_button.text = "Close"
		var _map = map.duplicate()
		pause_center.add_child(_map)
		_map.visible = true
	#cust min sizex 435, y 241

