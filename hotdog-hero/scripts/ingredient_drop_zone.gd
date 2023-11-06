class_name IngredientDropZone extends Node2D

@export var is_click_required: bool = false;
var _current_ingredient: Ingredient = null;

signal ingredient_attached(ingredient: Ingredient);


func _on_body_entered(body: Node2D):
	if body is Ingredient && !body.is_attached:
		if is_click_required: 
			_current_ingredient = body;
		else:
			print("hotdog attached");
			ingredient_attached.emit(body);
	else: 
		print("not hotdog", body);


func _on_body_exited(body: Node2D):
	if _current_ingredient == body:
		_current_ingredient = null;
		

func _on_input_event(viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("left_click"):
		if _current_ingredient != null && !_current_ingredient.is_attached:
			ingredient_attached.emit(_current_ingredient);
