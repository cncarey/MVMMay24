class_name PickUp
extends Node2D

var pickedUp = false
@export var pickUpId: String

@onready var hurtbox_component = $HurtboxComponent
@onready var hitbox_component = $HitboxComponent
@onready var ani = $AnimationPlayer
@onready var tb_marker = $TBMarker
@onready var collected = preload("res://Objects/Collected.tscn")

