extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var hasKey = false

func _ready():
	Global.plr = self

func _physics_process(delta):
	$UI/Key.visible = hasKey
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		
		$AnimatedSprite2D.flip_h = (direction < 0.0);
		$AnimatedSprite2D.animation = "Walk"
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.animation = "default"
	
	if velocity.y:
		$AnimatedSprite2D.animation = "Jump"
	
	move_and_slide()
