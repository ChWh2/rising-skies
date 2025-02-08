extends Node2D

var interactFocus : Interactable

var areas : Array[Interactable]

func _process(_delta):
	var closestInteractable : Node2D = null
	var closestRad : float = 0.0
	
	for i in areas:
		if is_instance_valid(i):
			var rad = i.global_position.distance_to(get_parent().global_position)
			
			if rad <= 200.0:
				if closestInteractable == null:
					closestInteractable = i
					closestRad = rad
				elif rad < closestRad:
					closestInteractable = i
					closestRad = rad
	
	
	if is_instance_valid(interactFocus):
		interactFocus.isInteractFocus = false
	interactFocus = closestInteractable
	
	if is_instance_valid(closestInteractable):
		closestInteractable.isInteractFocus = true
		visible = true
		$Text.global_position = interactFocus.global_position
	else:
		visible = false


func _on_area_2d_area_entered(area):
	if area is Interactable:
		areas.append(area)
