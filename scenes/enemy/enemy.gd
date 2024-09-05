extends CharacterBody2D

@export var projectile: PackedScene
@onready var shoot_position = $ShootPosition


func _on_timer_timeout():
	var projectile_instance = projectile.instantiate()
	add_sibling(projectile_instance)
	projectile_instance.global_position = shoot_position.global_position
	
