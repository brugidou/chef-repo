git "/home/#{node[:config][:user][:login]}" do
  action :checkout
  repository node[:config][:dotfiles][:url]
  reference node[:config][:dotfiles][:reference]
  enable_submodules true
  user node[:config][:user][:login]
  group node[:config][:user][:login]
  ignore_failure true # in case of no connectivity
  only_if { node[:config][:user][:login] }
end
