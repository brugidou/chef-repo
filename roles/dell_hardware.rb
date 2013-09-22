name "dell_hardware"
description "Dell XPS 13 hardware"
run_list [
  'role[sound]',
  "recipe[config::hardware]",
  'recipe[config::bluetooth]',
]
