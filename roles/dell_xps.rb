name "dell_xps"
description "Dell XPS 13"
run_list [
  "recipe[ntp]",
  "recipe[sudo]",
  "recipe[config]"
]

default_attributes(
  'authorization' => {
    'sudo' => {
      'groups' => ['m.brugidou'],
      'passwordless' => false
    }
  }
)
