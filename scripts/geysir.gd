extends Area2D

var lethal = false
var wait = false
@onready var waitChange = 0
@export var waitTime = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wait:
		waitChange += delta
	if waitChange > waitTime:
		waitChange = 0
		$AnimatedSprite2D.play()
		wait = false
	if wait:
		$AnimatedSprite2D.visible = false
	else:
		$AnimatedSprite2D.visible = true
	if $AnimatedSprite2D.get_frame() > 7 and $AnimatedSprite2D.get_frame() < 20:
		lethal = true
		$CollisionShape2D.disabled = false
	else:
		lethal = false
		$CollisionShape2D.disabled = true

func _on_body_entered(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player" and self.lethal:
			Globals.game_over = true
pass # Replace with function body.

func _on_animated_sprite_2d_animation_finished() -> void:
	wait = true
