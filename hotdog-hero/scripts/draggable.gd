class_name Draggable extends Area2D

signal drag_began;
signal drag_ended;

@export var raycaster: RayCast2D;
@export var ground_check_length: float = 125;

var _is_dragging = false;
var _parent: Node2D = null;
var _current_viewport: Viewport = null;
var _cursor_offset: Vector2 = Vector2.ZERO;

func _ready():
	_parent = self.get_parent();
	_current_viewport = get_viewport();
	raycaster.set_target_position(Vector2(0, ground_check_length));
	

func _process(_delta):
	if _is_dragging && _parent != null:
		_parent.position = _current_viewport.get_mouse_position() - _cursor_offset;
	

func _on_input_event(viewport: Viewport, event: InputEvent, _shape_idx: int):	
	if event.is_action_pressed("left_click"):
		print(_parent);
		viewport.set_input_as_handled();
		
		if Game.current_draggable != null && Game.current_draggable != self:
			print("not current draggable");
			return;
		
		_current_viewport = viewport;
		_is_dragging = !_is_dragging;
		
		if _is_dragging:
			_cursor_offset = viewport.get_mouse_position() - self.global_position;
			_parent.z_index = 99;
			drag_began.emit();
			Game.set_current_draggable(self);
		else:
			drag_ended.emit();
			_parent.z_index = 0;
			Game.set_current_draggable(null);


func _on_texture_button_pressed():
		if Game.current_draggable != null && Game.current_draggable != self:
			print("not current draggable");
			return;
		
		_is_dragging = !_is_dragging;
		
		if _is_dragging:
			_cursor_offset = _current_viewport.get_mouse_position() - self.global_position;
			drag_began.emit();
			_parent.move_to_front();
			Game.set_current_draggable(self);
		else:
			drag_ended.emit();
			check_for_surface_collision();
			Game.set_current_draggable(null);


func check_for_surface_collision():
	raycaster.set_target_position(Vector2(0, ground_check_length));
	
	if raycaster.is_colliding():
		var temp_collider: Area2D = raycaster.get_collider();
		print(temp_collider);
		
		var temp_point = raycaster.get_collision_point();
		print(temp_point);
		
		var temp_diff: Vector2 = global_position - temp_point
		print(temp_diff);
		
#	var space_state = get_world_2d().direct_space_state;
#	var query = PhysicsRayQueryParameters2D.create(self.position, self.position + Vector2(0, 125), collision_mask, [self]);
#	query.collide_with_areas = true;
##	query.hit_from_inside = true;
#
#	print(collision_mask);
#
#	var result = space_state.intersect_ray(query);
#	print(result);
	

func _draw():
	draw_line(self.position, self.position + Vector2(0, ground_check_length), Color.DODGER_BLUE);
