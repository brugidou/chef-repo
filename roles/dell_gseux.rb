name "dell_gseux"
description "Conf for geux's dell"
run_list [
  "role[xmonad]",
  "role[dell_xps]",
]

default_attributes(
  'authorization' => {
    'sudo' => {
      'groups' => ['g.seux'],
    }
  },
  'config' => {
    'packages' => ['firefox'],
    'user' => {
      'name' => 'Gregoire Seux',
      'login' => 'g.seux',
    },
#    'dotfiles' => {
#      'url' => 'https://github.com/brugidou/dotfiles.git',
#    }
  }
)
