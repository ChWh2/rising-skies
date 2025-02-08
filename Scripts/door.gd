extends Node2D
class_name Door

@export var closedDoorTransform := Vector2(0,0)
@export var openDoorTransform := Vector2(0,160)

@export var interactPoint : Interactable

@export var doorTime = 1

var targetDoorPosition = closedDoorTransform

@onready var referencePos = closedDoorTransform

@onready var doorTimer = Timer.new()

var preloadSound = preload("res://Scenes/sound_effects.tscn")

var soundFX : AudioStreamPlayer

func _ready():
	doorTimer.wait_time = doorTime
	doorTimer.one_shot = true
	
	add_child(doorTimer)
	
	doorTimer.start()
	doorTimer.paused = true

func _process(_delta):
	position = targetDoorPosition.lerp(closedDoorTransform, doorTimer.time_left/doorTime)
	
	if doorTimer.time_left == 0:
		soundFX.stop()

func openDoor() -> void:
	if is_instance_valid(interactPoint):
		interactPoint.disconnect("Interacted", openDoor)
		interactPoint.queue_free()
	targetDoorPosition = openDoorTransform
	doorTimer.paused = false
	
	soundFX = preloadSound.instantiate()
	add_child(soundFX)
