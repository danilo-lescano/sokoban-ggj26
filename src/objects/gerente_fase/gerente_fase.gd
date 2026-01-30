extends Node2D

@export var numero_fase: int = 1

var tile_size: int = 64
var offset: int = 32

var scene_map := {
	"J":  { "scene": preload("res://src/objects/player/player.tscn") },
	"W":  { "scene": preload("res://src/objects/props/wall/bloqueio.tscn") },
	"C":  { "scene": preload("res://src/objects/props/caixa/caixa.tscn") },

	"MR": { "scene": preload("res://src/objects/props/mask/mask.tscn"), "color": Game.MaskColor.RED },
	"MG": { "scene": preload("res://src/objects/props/mask/mask.tscn"), "color": Game.MaskColor.GREEN },
	"MB": { "scene": preload("res://src/objects/props/mask/mask.tscn"), "color": Game.MaskColor.BLUE },
	"MY": { "scene": preload("res://src/objects/props/mask/mask.tscn"), "color": Game.MaskColor.YELLOW },
}

func _ready() -> void:
	var data: Dictionary = load_json("res://data/fases/fase" + str(numero_fase) + ".json")
	spawn_from_map(data)

func load_json(path: String) -> Dictionary:
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Não foi possível abrir: " + path)
		return {}
	var content: String = file.get_as_text()
	file.close()

	var parsed = JSON.parse_string(content)
	if typeof(parsed) != TYPE_DICTIONARY:
		push_error("JSON inválido: " + path)
		return {}
	return parsed

func spawn_from_map(data: Dictionary) -> void:
	for key in data.keys():
		if not scene_map.has(key):
			push_warning("Sem scene mapeada para: " + key)
			continue

		var config = scene_map[key]
		var scene: PackedScene = config["scene"]

		for grid_pos in data[key]:
			var node = scene.instantiate()
			node.position = grid_to_world(grid_pos)

			if config.has("color"):
				node.color = config["color"]

			add_child(node)


func grid_to_world(grid_pos: Array) -> Vector2:
	return Vector2(
		grid_pos[1] * tile_size + offset,
		grid_pos[0] * tile_size + offset
	)
