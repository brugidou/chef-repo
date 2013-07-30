#
# Cookbook Name:: config
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if Chef::Config[:solo]
  node.__unless[:config][:user][:name] = ENV['SUDO_USER'] || ENV['USER'] || 'A random peon'
end


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
