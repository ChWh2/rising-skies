extends Sprite2D

func takeKey():
	Global.plr.hasKey = true
	$InteractPoint.queue_free()
	queue_free()
