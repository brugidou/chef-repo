name "dell_mbrugidou"
description "Conf for mbrugidou's dell"
run_list [
  'recipe[config::spotify]',
  "role[awesome]",
  "role[dell_xps]",
]

default_attributes(
  'authorization' => {
    'sudo' => {
      'groups' => ['m.brugidou'],
    }
  },
  'config' => {
    'packages' => ['chromium'],
    'user' => {
      'name' => 'Maxime Brugidou',
      'login' => 'm.brugidou',
    },
    'dotfiles' => {
      'url' => 'https://github.com/brugidou/dotfiles.git',
    }
  }
)
