name "sound"
description "Install and configure alsa"
run_list [
  "recipe[config::hardware]",
]

default_attributes(
  'config' => {
    'packages' => [
      'alsa-base',
      'alsa-utils',
      'volumeicon-alsa',
    ]
  }
)
