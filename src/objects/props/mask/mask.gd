extends Area2D

@export var color: Game.MaskColor = Game.MaskColor.RED
@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	match color:
		Game.MaskColor.RED:
			sprite.texture = preload("res://assets/placeholders/aka.png")
		Game.MaskColor.BLUE:
			sprite.texture = preload("res://assets/placeholders/ao.png")
		Game.MaskColor.YELLOW:
			sprite.texture = preload("res://assets/placeholders/kiiroi.png")
		Game.MaskColor.GREEN:
			sprite.texture = preload("res://assets/placeholders/midori.png")


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		(body as Player).equip_new_mask(color)
