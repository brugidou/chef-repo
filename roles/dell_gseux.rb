name "dell_gseux"
description "Conf for geux's dell"
run_list [
  "role[dell_xps]",
  "recipe[config::wicd]",
  "role[xmonad]",
  "recipe[config::steam]",
  'recipe[config::chef]'
]

default_attributes({
  'authorization' => {
    'sudo' => {
      'groups' => ['g.seux'],
    }
  },
  'config' => {
    'packages' => ['iceweasel'],
    'user' => {
      'name' => 'Gregoire Seux',
      'login' => 'g.seux',
    },
#    'dotfiles' => {
#      'url' => 'https://github.com/brugidou/dotfiles.git',
#    }
  }
})
