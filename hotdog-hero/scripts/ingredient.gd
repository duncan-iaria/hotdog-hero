class_name Ingredient extends Node2D

enum INGREDIENT_TYPE { POURABLE, ATTACHABLE }

@export var id: String = '';
@export var display_name: String = '';
@export var cost: int = 1;
@export var ingredient_type: INGREDIENT_TYPE;
@export var DRAGGABLE_NODE: Draggable;


func on_attached():
	DRAGGABLE_NODE.set_process(false);
	DRAGGABLE_NODE.hide();
