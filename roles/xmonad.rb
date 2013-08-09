name "xmonad"
description "Install and configure xmonad"
run_list [
  "recipe[config::hardware]"
]

default_attributes({
  'config' => {
    'packages' => [
      'xorg',
      'dzen2',
      'rxvt-unicode',
      'xmonad'
    ]
  }
})
