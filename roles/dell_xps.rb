name "dell_xps"
description "Dell XPS 13"
run_list [
  "role[dell_hardware]",
  "recipe[ntp]",
  "recipe[sudo]",
  "recipe[config::hardware]",
  "recipe[config::krb5]",
  "recipe[config::vpn]"
]

default_attributes(
  'authorization' => {
    'sudo' => {
      'passwordless' => false,
      'sudoers_defaults' => [
        'env_reset',
        'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
      ]
    }
  },
  'java' => {
    'jdk_version' => '8'
  }
)
