extends Node2D
@onready var sfx_player = $sfxPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func playTempSound(sfx: VariablePitchAudioStreamPlayer):
	var ap : VariablePitchAudioStreamPlayer = sfx.duplicate()
	get_tree().root.add_child(ap)
	ap.play()
	await  ap.finished
	ap.queue_free()
