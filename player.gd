extends CharacterBody2D


const SPEED = 200.0
var hp = 100

@export var sword_instance : PackedScene


func _physics_process(delta):
	check_if_alive()
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func check_if_alive():
	if hp < 0:
		die()


func die():
	print("gaame oover")


func hurt(damage):
	hp -= damage
	print(hp)


func _on_sword_timer_timeout():
	var sword = sword_instance.instantiate()
	get_node("../..").add_child(sword)
	sword.position.x = global_position.x + randi_range(-32, 32)
	sword.position.y = global_position.y + randi_range(-32, 32)
