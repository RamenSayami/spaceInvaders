extends CharacterBody2D

@export var speed := 10

signal laser

var can_shoot:= true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	var direction = Input.get_vector("left","right","up","down")

	velocity += direction * speed
	move_and_slide()

	#shoot input
	if Input.is_action_just_pressed("Shoot") and can_shoot==true: 
		laser.emit($LaserStartPosition.global_position)
		can_shoot=false
		$LaserTimer.start()
		$LaserSound.play()

func play_damage_sound():
	$DamageSound.play()

func _on_timer_timeout():
	can_shoot=true
