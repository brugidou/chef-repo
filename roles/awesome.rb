name "awesome"
description "Install and configure awesome"
run_list [
  "recipe[config]",
]

default_attributes(
  'config' => {
    'packages' => [
      'xorg',
      'awesome',
    ]
  }
)
