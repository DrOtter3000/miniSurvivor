extends CharacterBody2D


const SPEED = 50
var hp = 100
var damage = 10 
@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_if_alive()
	var direction = player.global_position - global_position
	velocity = direction.normalized() * SPEED
	move_and_slide()


func check_if_alive():
	if hp < 0:
		die()


func _on_hit_box_body_entered(body):
	if body == player:
		player.hurt(damage)
		$HurtTimer.start()


func _on_hurt_timer_timeout():
	player.hurt(damage)
	$HurtTimer.start()


func _on_hit_box_body_exited(body):
	if body == player:
		$HurtTimer.stop()


func die():
	queue_free()


func hurt(damage_taken):
	hp -= damage_taken
