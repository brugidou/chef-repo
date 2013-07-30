name "xmonad"
description "Install and configure xmonad"
run_list [
  "recipe[config]",
]

default_attributes(
  'config' => {
    'packages' => [
      'xorg',
      'xmonad',
    ]
  }
)
