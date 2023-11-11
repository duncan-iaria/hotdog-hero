class_name Ingredient extends RigidBody2D

@export var ground_check_raycaster: RayCast2D;
@export var ground_check_length: float = 125;

# This is where the item should drop to
# When its dropped above collision
var _drop_target_position: float = 0;
var _is_dropping: bool = false;

func _physics_process(delta):
	if _is_dropping:
		if self.position.y > _drop_target_position:
			print("not dropping anymore");
			gravity_scale = 0;
			linear_velocity = Vector2.ZERO;
			_is_dropping = false;


func on_drag_end():
	_check_for_surface_collision();


func _check_for_surface_collision():
	ground_check_raycaster.set_target_position(Vector2(0, ground_check_length));
	
	if ground_check_raycaster.is_colliding():
		var temp_collider: Area2D = ground_check_raycaster.get_collider();
		print(temp_collider);
		
		var temp_point = ground_check_raycaster.get_collision_point();
		print(temp_point);
		
		var temp_diff: Vector2 = global_position - temp_point
		print(temp_diff);
		
		if temp_diff.y < 0:
			gravity_scale = 1;
			
			# Second addition is just something to add a little to it
			# based on how far up it was originally (so we get a little fake perspective)
			_drop_target_position = (abs(temp_diff.y) + global_position.y) + (abs(temp_diff.y) * .5);
			
			_is_dropping = true;
	# Should always be colliding with current implementation - but hey
	else: 
		gravity_scale = 1;
		

func _draw():
	draw_line(Vector2.ZERO, Vector2(0, ground_check_length), Color.DODGER_BLUE);
