extends Node2D
@onready var ani = $AnimationPlayer

@export var switchId: String
# Called when the node enters the scene tree for the first time.
func _ready():
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
