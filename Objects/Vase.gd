extends Node2D

@export var state = 1
var audioFinished = false
@onready var ani = $Ani
@onready var hurtbox_component = $HurtboxComponent
@onready var flash_component = $FlashComponent
@onready var scale_component = $ScaleComponent
@onready var breakSound = $VariablePitchAudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hurtbox_component.hurt.connect(onBreak)
	ani.play("default")
	ani.animation_finished.connect(animtionFinished)
	pass # Replace with function body.

func onBreak(hb):
	state = 2
	flash_component.flash()
	scale_component.tween_scale()
	if breakSound != null:
		breakSound.play_with_variance(0.49)
	
	ani.play("break")

func animtionFinished():
	match state:
		2:
			hurtbox_component.is_invincible = true
			ani.hide()
			state = 3
			if audioFinished:
				queue_free()
			pass

func _on_variable_pitch_audio_stream_player_finished():
	audioFinished = true
	if state == 3:
		queue_free()
	pass # Replace with function body.
