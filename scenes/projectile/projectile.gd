extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 150

func _ready():
	var player = get_tree().get_first_node_in_group("player")
	var distance = position.distance_to(player.position)
	var duration = distance / speed
	
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", player.position,duration)\
	.set_ease(Tween.EASE_IN_OUT)\
	.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", scale * 3.0, duration)
	tween.set_parallel(false)
	tween.tween_property(animated_sprite_2d, "modulate", Color.TRANSPARENT, 0.5)
	tween.tween_callback(queue_free)
