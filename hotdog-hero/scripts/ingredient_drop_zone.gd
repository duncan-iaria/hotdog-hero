class_name IngredientDropZone extends Node2D

signal ingredient_attached(ingredient: Ingredient);

func _on_body_entered(body: Node2D):
	if body is Ingredient && !body.is_attached:
		print("hotdog attached");
		ingredient_attached.emit(body);
	else: 
		print("not hotdog", body);
