extends Resource
class_name Item

enum Rarity {COMMON = 0, UNCOMMON = 1, RARE = 2, UNIQUE = 3}

@export var name: String
@export var maxStack: int
@export var sprite: Texture2D
@export var rarity: Rarity

@export var is_crafted: bool = false
@export var required_items: Dictionary[Item, int]
