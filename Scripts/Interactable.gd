extends Area2D
class_name Interactable

@export var interactText = "E to interact"
@export var inputAction = "Interact"

@export var takesKey = true

var isInteractFocus = false

signal Interacted

func _process(_delta):
	if isInteractFocus:
		if (takesKey and Global.plr.hasKey) or (!takesKey):
			if Input.is_action_just_pressed(inputAction):
				if (takesKey):
					Global.plr.hasKey = false
				Interacted.emit()
