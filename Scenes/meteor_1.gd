extends Area2D

var speed: int 
var direction_x: float
var rotation_speed: int

var meteors_shapes = [
	"res://Images/Meteors/meteorBrown_big1.png",
	"res://Images/Meteors/meteorBrown_big2.png", 
	"res://Images/Meteors/meteorBrown_big3.png", 
	"res://Images/Meteors/meteorBrown_big4.png", 
	"res://Images/Meteors/meteorBrown_med1.png", 
	"res://Images/Meteors/meteorBrown_med3.png", 
	"res://Images/Meteors/meteorBrown_small1.png", 
	"res://Images/Meteors/meteorBrown_small2.png", 
	"res://Images/Meteors/meteorBrown_tiny1.png", 
	"res://Images/Meteors/meteorBrown_tiny2.png", 
	"res://Images/Meteors/meteorGrey_big1.png", 
	"res://Images/Meteors/meteorGrey_big2.png", 
	"res://Images/Meteors/meteorGrey_big3.png", 
	"res://Images/Meteors/meteorGrey_big4.png", 
	"res://Images/Meteors/meteorGrey_med1.png", 
	"res://Images/Meteors/meteorGrey_med2.png", 
	"res://Images/Meteors/meteorGrey_small1.png", 
	"res://Images/Meteors/meteorGrey_small2.png", 
	"res://Images/Meteors/meteorGrey_tiny1.png", 
	"res://Images/Meteors/meteorGrey_tiny2.png"
]

signal collision

var can_collide := true

func _ready():
	var rng:= RandomNumberGenerator.new()
	
	var random_path = meteors_shapes[rng.randi_range(0,meteors_shapes.size()-1)]
	$MeteorBrownBig1.texture=load(random_path)
	
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x, random_y)
	
	#speed/rotation/direction
	speed = rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40,100)
	

func _process(delta):
	position += Vector2(direction_x, 1) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body):
	if can_collide:
		collision.emit()
	


func _on_area_entered(area):
	area.queue_free()
	$ExplosionSound.play()
	$MeteorBrownBig1.hide()
	can_collide = false
	await get_tree().create_timer(1).timeout
	queue_free()
