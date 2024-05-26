extends TextureButton

class_name MapButton



@onready var panel : Panel = $Panel
@onready var lines = $Lines
@onready var room_name_label = %RoomNameLabel

@onready var key = %Key
@onready var clue = %Clue
@onready var echo = %Echo
@onready var gem = %Gem
@onready var power_up = %PowerUp

@onready var line : Line2D = $Line2D

@export var roomDisplayName:String = ""
@export var roomName: String = ""
@export var keys : Array[String] = []
@export var clues : Array[String] = []
@export var echos : Array[String] = []
@export var gems : Array[String] = []
@export var powerUps : Array[String] = []
@export var neighbors : Array[String] = []

@onready var tween : Tween


func _ready():
	if get_parent() != null:
		for r in get_parent().get_children():
			if r is MapButton && neighbors.any(func(n): return Global.visitedRooms.has(r.roomName) && r.roomName == n):
				var _line = line.duplicate()
				_line.add_point(global_position + panel.size/2)
				_line.add_point(r.global_position + panel.size/2)
				lines.add_child(_line)
				pass
			
		
	if roomName != "" && Global.visitedRooms.has(roomName):
	
		if room_name_label != null:
			room_name_label.text = roomDisplayName
		
		if keys.all(func(k): return Global.collectedKeys.has(k)):
			key.queue_free()
		if gems.all(func(g): return Global.collectedGems.has(g)):
			gem.queue_free()
		if powerUps.all(func(p): return Global.openedChests.has(p) || Global.guardianStatuses.has(p)):
			power_up.queue_free()
		if echos.all(func(e): return Global.foundTwinkles.has(e)):
			echo.queue_free()
			
		self.button_pressed = true
		disabled =false
		show()
	else:
		disabled = true
		hide()
	
func increaseLevel():
	#TODO if the button pressed is a fast travel point 
	#change the scene to that location if you aren't already there
	pass

signal onHoverStart()
signal onHoverStop()

func _on_mouse_entered():
	onHoverStart.emit()
	
func _on_mouse_exited():
	onHoverStop.emit()
	pass # Replace with function body.
