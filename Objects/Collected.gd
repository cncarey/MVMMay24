extends AnimatedSprite2D

@export var stream : AudioStream
@onready var audioPlayer = $AudioStreamPlayer2D

func _ready():
	if stream !=null:
		audioPlayer.stream = stream
		audioPlayer.play()
	pass

func _on_animation_finished():
	queue_free()
