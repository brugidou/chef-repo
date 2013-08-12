#
# Cookbook Name:: config
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:config][:packages].each do |p|
  package p
end

service 'acpid' do
  action [:enable, :start]
end

execute "sed -i 's/#LID_SLEEP/LID_SLEEP/' /etc/default/acpi-support" do
  notifies :restart, 'service[acpid]'
  only_if "grep '#LID_SLEEP' /etc/default/acpi-support"
end

execute "sed -i 's/CONTROL_BLUETOOTH=0/CONTROL_BLUETOOTH=1/' /etc/laptop-mode/conf.d/bluetooth.conf" do
  only_if "grep CONTROL_BLUETOOTH=0 /etc/laptop-mode/conf.d/bluetooth.conf"
end

#Sound unmuting
execute "amixer sset Master unmute" do
  only_if "amixer sget Master | grep 'off]'"
end

#Backlight control after sleep
cookbook_file "/etc/pm/sleep.d/99backlight" do
  owner "root"
  group "root"
  mode "0744"
end
