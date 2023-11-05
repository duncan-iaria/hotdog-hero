# A Class for anything that can have ingredients put on it
# LIKE A BUN!!!
class_name IngredientContainer extends Node2D

func on_ingredient_attached(ingredient: Ingredient):
		ingredient.on_attached(self);

