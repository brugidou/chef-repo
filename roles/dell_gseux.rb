name "dell_gseux"
description "Conf for geux's dell"
run_list [
  "role[dell_xps]",
  "role[xmonad]",
  "recipe[config::steam]"
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
