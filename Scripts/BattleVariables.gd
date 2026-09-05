class_name BattleVariables

# action priority 
static var normal = 'normal'
static var concurrent_stun = 'concurrent_stun'
static var untargetable = 'untargetable'

# lower index = more priority; like ranking
static var priority_list = [
	untargetable,
	concurrent_stun, 
	normal
]
