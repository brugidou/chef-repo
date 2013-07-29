#
# Cookbook Name:: config
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



# Hardware

%w(laptop-mode-tools acpi-support fdpowermon xorg awesome vim).each do |p|
  package p
end

service 'acpid' do
  action [:enable, :start]
end

execute "sed -i 's/#LID_SLEEP/LID_SLEEP/' /etc/default/acpi-support" do
  notifies :restart, 'service[acpid]'
  only_if "grep '#LID_SLEEP' /etc/default/acpi-support"
end

%w(alsa-base alsa-utils volumeicon-alsa).each do |p|
  package p
end

git '/home/m.brugidou' do
  repository 'https://github.com/brugidou/dotfiles.git'
  reference 'master'
  action :sync
  enable_submodules true
  user 'm.brugidou'
  group 'm.brugidou'
end

package 'chromium'

# Network

package 'wicd'
package 'bluetooth'
package 'blueman'

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  keyserver 'keyserver.ubuntu.com'
  key '94558F59'
end

#package 'spotify-client'
