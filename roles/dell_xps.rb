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
      'passwordless' => false,
      'sudoers_defaults' => [
        'env_reset',
        'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
      ]
    }
  }
)
