class_name Draggable extends Area2D

signal drag_began;
signal drag_ended;

var _is_dragging = false;
var _parent: Node2D = null;
var _current_viewport: Viewport = null;
var _cursor_offset: Vector2 = Vector2.ZERO;

func _ready():
	_parent = self.get_parent();
	

func _process(_delta):
	if _is_dragging && _parent != null:
		_parent.position = _current_viewport.get_mouse_position() - _cursor_offset;
	

func _on_input_event(viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("left_click"):
		_current_viewport = viewport;
		_is_dragging = !_is_dragging;
		
		if _is_dragging:
			_cursor_offset = viewport.get_mouse_position() - self.global_position;
			drag_began.emit();
		else:
			drag_ended.emit();
	


func _on_drag_began():
	pass # Replace with function body.
