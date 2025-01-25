extends Area2D

@export var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if index == 0:
		$RedKeySprite.visible = true
	if index == 1:
		$GreenKeySprite.visible = true
	if index == 2:
		$BlueKeySprite.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	Globals.status_text = "You found a key!"
	Globals.status_text_changed = true
	if index == 0:
		Globals.has_key_1 = true
		self.queue_free()
	if index == 1:
		Globals.has_key_2 = true
		self.queue_free()
	if index == 2:
		Globals.has_key_3 = true
		self.queue_free()
