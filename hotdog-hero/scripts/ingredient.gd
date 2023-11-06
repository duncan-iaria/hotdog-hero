class_name Ingredient extends RigidBody2D

enum INGREDIENT_TYPE { POURABLE, ATTACHABLE }

@export var id: String = '';
@export var display_name: String = '';
@export var cost: int = 1;
@export var ingredient_type: INGREDIENT_TYPE;
@export var DRAGGABLE_NODE: Draggable;

var is_attached: bool = false;

func on_attached(node_attached_to: Node2D):
	if is_attached: return;
	
	is_attached = true;
	var temp_current_pos = self.global_position;
	
	get_parent().remove_child(self);
	node_attached_to.add_child(self);
	self.global_position = temp_current_pos;
	
	DRAGGABLE_NODE.set_process(false);
	DRAGGABLE_NODE.hide();
