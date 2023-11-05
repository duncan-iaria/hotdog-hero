class_name IngredientDropZone extends Node2D

func _on_body_entered(body: Node2D):
	if body.get_parent() is Ingredient:
		print("hotdog attached");
		body.get_parent().on_attached();
	else: 
		print("not hotdog", body);
