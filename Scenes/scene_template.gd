extends Node2D

@onready var doors = $Doors
@onready var mainPlayer = $MainPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.lastLocation != null || Global.lastLocation != "":
		#for each thing in door if the last location is in the list
		# set the player location to the dooor location
		if doors.get_child_count() > 0:
			for d in doors.get_children():
				var _d = d as Door
				if _d.doorId == Global.lastLocation:
					mainPlayer.global_position = _d.global_position
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
