default[:config][:packages] = [
  'laptop-mode-tools',
  'acpi-support',
  'fdpowermon',
  'firmware-iwlwifi'
]
default[:config][:user][:name] = nil
default[:config][:user][:login] = nil

default[:config][:dotfiles][:url] = nil
default[:config][:dotfiles][:reference] = 'master'
default[:config][:dotfiles][:link] = false
