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
  ignore_failure true # in case of no connectivity
end

package 'chromium'

# Network

package 'wicd'
package 'bluetooth'
package 'blueman'

file '/etc/wicd/encryption/templates/wpa2-peap-criteo' do
  content <<EOF
name = WPA2 PEAP for CRITEO_CORP
author = Maxime Brugidou
version = 1
require identity *Identity password *Password 
protected password *Password 
-----
ctrl_interface=/var/run/wpa_supplicant
network={
        ssid="$_ESSID"
        scan_ssid=$_SCAN
        proto=RSN
        key_mgmt=WPA-EAP
        eap=PEAP
        identity="$_IDENTITY"
        password="$_PASSWORD"
        ca_cert="/usr/local/share/criteo/criteo_lan.cer"
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
}
EOF
end

execute 'activate wpa2-peap-criteo' do
  command 'echo wpa2-peap-criteo >> /etc/wicd/encryption/templates/active'
  not_if 'grep wpa2-peap-criteo /etc/wicd/encryption/templates/active'
end

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  keyserver 'keyserver.ubuntu.com'
  key '94558F59'
end

#package 'spotify-client'
