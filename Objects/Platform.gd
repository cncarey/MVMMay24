extends Node2D
@onready var ani = $AnimationPlayer
@onready var switch_label = $SwitchLabel

@export var switchId: String
@export var platformText: String
# Called when the node enters the scene tree for the first time.
func _ready():
	if switch_label != null:
		switch_label.text = platformText
	if Global.switchStatuses.has(switchId):
		if Global.switchStatuses[switchId]:
			ani.play("move")
		else: 
			ani.pause()
	else:
		ani.pause()
	
	Global.switchStatusesChanged.connect(toggleMoving)

func toggleMoving(changedSwitchId: String, status: bool):
	if changedSwitchId == switchId:
		if status:
			ani.play("move")
		else: 
			ani.pause()
	pass
