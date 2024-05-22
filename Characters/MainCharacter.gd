extends CharacterBody2D

#IDEA if we want to make power-up move this to be a resource

@onready var camera_2d = $Camera2D

#IDEA if we want to make power-up move this to be a resource
@export var SPEED = 200.0
@export var ACCELERATION = 600
@export var JUMP_VELOCITY = -500.0
@export var AIR_RESISTANCE = 200.0
@export var AIR_ACCELERATION = 400.0
@export var lastDirection = "_right"

var justWallJumped: bool = false
var usedDoubleJump: bool = false
var airJump: bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var startPosition = global_position
@onready var coyoteJumpTimer = $CoyoteJump
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

@export var tilemap :TileMap

func _ready():
	resetBoundaries()
	

func resetBoundaries():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var mapSizePixesls = mapRect.size * tileSize
	
	camera_2d.limit_left = 0
	camera_2d.limit_top = 0
	camera_2d.limit_right = mapSizePixesls.x
	camera_2d.limit_bottom = mapSizePixesls.y

func _physics_process(delta):
	handleGravity(delta)
	#handleWallJump()
	handleJump()
	
	var direction = Input.get_axis("Left", "Right")
	handleAcceleration(direction, delta)
	handleAirAcceleration(direction, delta)
	applyAirResistance(direction, delta)
	playAnimation(direction)

	var wasOnFloor = is_on_floor()
	move_and_slide()
	var justLeftLedge = wasOnFloor && !is_on_floor() and velocity.y >= 0
	
	if justLeftLedge:
		coyoteJumpTimer.start()
		
	justWallJumped = false


func playAnimation(direction: float):
	if direction == 0:
		animation_player.play("idle" + lastDirection)
	else:
		lastDirection = "_left" if direction < 0 else "_right"
		animation_player.play("run" + lastDirection)
		
	if !is_on_floor():
		animation_player.play("jump" + lastDirection)
		
	#TODO determine when the user is falling
	#TODO determine when the player has landed

		
	
func handleGravity(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		
func handleWallJump():
	if !is_on_wall_only(): return
	
	var wallNormal = get_wall_normal()
	if Input.is_action_just_pressed("Jump"):
		velocity.x = wallNormal.x * SPEED
		velocity.y = JUMP_VELOCITY
		justWallJumped = true	

func handleJump():
	if is_on_floor():
		airJump = true
		
	if is_on_floor() || coyoteJumpTimer.time_left > 0.0:
		if Input.is_action_just_pressed("Jump"):
			velocity.y = JUMP_VELOCITY
	
	elif !is_on_floor():
		#if Input.is_action_just_pressed("Jump") && velocity.y < (JUMP_VELOCITY/2):
			#velocity.y = JUMP_VELOCITY/2
			#print('can jump')
			#print(airJump)
		
		#double jump
		if Global.openedChests.has("DoubleJump"):
			if Input.is_action_just_pressed("Jump") && airJump && !justWallJumped:
				velocity.y = JUMP_VELOCITY * 0.8
				airJump = false
				print('double jump done')
				print('can jump')
				print(airJump)
			
func _input(event):
	if event.is_action_pressed("Down") && is_on_floor():
		position.y  += 1
			
func handleAcceleration(direction: float, delta):
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func applyAirResistance(direction: float, delta):
	if direction == 0 and !is_on_floor():
		velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE * delta)

func handleAirAcceleration(direction: float, delta):
	if is_on_floor(): return
	if direction != 0:
		velocity.x = move_toward(velocity.x, SPEED * direction, AIR_ACCELERATION * delta)


func _on_hazard_detector_area_entered(area):
	self.global_position = startPosition
	pass # Replace with function body.
