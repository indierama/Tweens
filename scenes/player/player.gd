extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@export var speed = 100.0

var max_health = 100

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_method(print_health, max_health, 0, 2.0)
	

func print_health(health):
	print(health)
	

func _physics_process(delta):
	get_input()
	update_animation()
	flip()
	move_and_slide()


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func update_animation():
	if velocity.length() > 0.0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")


func flip():
	if velocity.x != 0:
		animated_sprite.flip_h = velocity.x < 0.0
