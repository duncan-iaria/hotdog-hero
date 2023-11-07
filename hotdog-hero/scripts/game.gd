extends Node

var current_draggable: Draggable = null;


func set_current_draggable(draggable: Draggable):
	current_draggable = draggable;
	print("current draggable", current_draggable);


func clear_current_draggable():
	current_draggable = null;
