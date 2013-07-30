name "sound"
description "Install and configure alsa"
run_list [
  "recipe[config]",
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
