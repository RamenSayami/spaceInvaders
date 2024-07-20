extends CanvasLayer

static var image = load("res://Images/UI/playerLife1_red.png") 
var time_elapsed := 0

func set_health(health):
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	for i in health:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
	print('UI ', health)


func _on_score_timer_timeout():
	time_elapsed +=1
	$MarginContainer/Score.text = str(time_elapsed)
	Global.score = time_elapsed
