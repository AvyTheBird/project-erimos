extends Item
class_name ArmorItem

enum WearOn {HEAD, BACK, BODY, ACCESSORY, SHIELD}
enum Attuned {DAY, NIGHT, PHYTA, EARTH, CRYSTAL}

@export var wearon: WearOn
@export var attuned_to: Attuned
@export var is_heavy: bool
