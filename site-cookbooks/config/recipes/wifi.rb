package 'wicd'
package 'bluetooth'
package 'blueman'

file '/etc/wicd/encryption/templates/wpa2-peap-criteo' do
  content <<EOF
name = WPA2 PEAP for CRITEO_CORP
author = #{node[:config][:user][:name]}
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

execute 'update-ca-certificates' do
   action :nothing
end

remote_directory '/usr/local/share/ca-certificates' do
  notifies :run, 'execute[update-ca-certificates]'
end
