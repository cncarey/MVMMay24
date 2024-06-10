extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var rand_ponits = $randPonits

var seen = false

var target : Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
	previousPosition = global_position
	randomize()
	if rand_ponits.get_child_count() > 0:
		var ranChild = randi_range(0, rand_ponits.get_child_count()-1)
		target = rand_ponits.get_children()[ranChild]
		#loop through and set a rand point
		pass
	pass # Replace with function body.

var time = 0
var t = 0.5 # influences moving towards target
var p = 0.5 # influences oscillating
var speed = 50
var previousPosition
func _process(delta):
	if target != null && seen:
		time += delta
		var towards_target = (target.global_position - global_position).normalized()
		var perpendicular = Vector2(towards_target.y, -towards_target.x)
		global_position += (t * towards_target + p * perpendicular * sin(time)) * speed * delta
		animated_sprite_2d.flip_h = previousPosition.x < global_position.x
		previousPosition = global_position
		
func _on_hurtbox_component_hurt(hitbox):
	if !seen:
		animated_sprite_2d.play("leaveCeiling")
	pass # Replace with function body.

func leftCeiling():
	seen = true
	animated_sprite_2d.play("flying")

func _timeout():
	if seen:
		queue_free()
	pass # Replace with function body.

