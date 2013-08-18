#
# Cookbook Name:: config
# Recipe:: steam
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "dpkg --add-architecture i386" do
  not_if "(dpkg --print-foreign-architectures; dpkg --print-architecture) | grep i386"
end

package "steam"

