extends Node2D

@export var code : int

var isOpen = false

var digits := [1,1,1,1,1]

signal codeCorrect

func _process(_delta):
	var testCode = 0
	
	for i in digits.size():
		testCode += pow(10, i) * digits[4 - i]
	
	if code == testCode:
		codeCorrect.emit()
		queue_free()

func _on_interact_point_interacted():
	if $UI.visible:
		$UI.visible = false
	else:
		$UI.visible = true

func digit(label : Label, index : int):
	if digits[index] == 5:
		digits[index] = 1
		label.text = "1"
	else:
		digits[index] += 1
		label.text = str(label.text.to_int() + 1)

func _on_digit_1_pressed():
	digit($UI/Digit1/Text, 0)
func _on_digit_2_pressed():
	digit($UI/Digit2/Text, 1)
func _on_digit_3_pressed():
	digit($UI/Digit3/Text, 2)
func _on_digit_4_pressed():
	digit($UI/Digit4/Text, 3)
func _on_digit_5_pressed():
	digit($UI/Digit5/Text, 4)
