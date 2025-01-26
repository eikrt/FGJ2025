extends PathFollow2D

var reverse = 1
@export var SPEED = 0.4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.progress_ratio += delta * reverse * SPEED
	if self.progress_ratio >= 1.0:
		reverse = -1
		$Shark/AnimatedSprite2D.flip_h = true
	if self.progress_ratio <= 0.0:
		reverse = 1
		$Shark/AnimatedSprite2D.flip_h = false
