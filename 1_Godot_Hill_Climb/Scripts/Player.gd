extends RigidBody2D

var wheels = []
var speed = 50000
var max_speed_right = 40
var max_speed_left = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		for wheel in wheels:
			if wheel.angular_velocity < max_speed_right:
				wheel.apply_torque_impulse(speed * delta * 60)
	if Input.is_action_pressed("ui_left"):
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed_left:
				wheel.apply_torque_impulse(-speed * delta * 60)
				
