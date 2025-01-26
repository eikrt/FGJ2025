extends RichTextLabel

var text_changed = false
var textChange = 0
var textTime = 4.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = Globals.status_text
	if Globals.status_text_changed or Globals.game_won:
		self.visible = true
		text_changed = true
		
		Globals.status_text_changed = false
	if text_changed and not Globals.game_won:
		textChange += delta
		if textChange > textTime:
			textChange = 0
			text_changed = false
			self.visible = false
	if Globals.game_won:
		self.position.x = 130
		self.position.y = 360 / 2 + 130
