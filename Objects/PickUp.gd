class_name PickUp
extends Node2D

var pickedUp = false
@export var pickUpId: String

@onready var hurtbox_component = $HurtboxComponent
@onready var hitbox_component = $HitboxComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
