extends Node


var player_pos = null
var thr_pos = null
var game_over = false
var running = false
var game_game_over = false
var main_instance = preload("res://scenes/main/main.tscn")
var main_menu_instance = preload("res://scenes/menu/main_menu.tscn")
var coins = 0
var has_key_1 = false
var has_key_2 = false
var has_key_3 = false
var current_checkpoint = null
var status_text = ""
var status_text_changed = false
var game_won = false
var tutorialOn = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over:
		print("Game over")
	if running:
		Input.set_custom_mouse_cursor(load("res://assets/cursor.png"))
		get_tree().get_root().get_node("MainMenu").queue_free()
		get_tree().get_root().add_child(main_instance.instantiate())
		running = false
	if game_game_over:
		pass
	if Input.is_action_pressed("esc"):
		get_tree().quit()
		
