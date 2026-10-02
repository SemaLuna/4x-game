@abstract
class_name EffectResource
extends Resource

enum Target {ALLY, ENEMY}
enum EffectRange {MELEE, RANGED, ALL}

## Determines which units can be affected
@export var target: Target = Target.ENEMY
## Determines which positions can be selected
@export var effect_range: EffectRange = EffectRange.MELEE
