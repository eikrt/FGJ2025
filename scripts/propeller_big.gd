extends Node2D

@export var speed = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BigPropeller.speed = speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
