include_recipe 'config::bluetooth'

package 'wicd'

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
        ca_cert="#{cert_path}"
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
}
EOF
end

file '/etc/wicd/encryption/templates/wired-criteo' do
  content <<EOF
name = 802.1x for CRITEOIS
author = #{node[:config][:user][:name]}
version = 1
require identity *Identity password *Password
protected password *Password
-----
ctrl_interface=/var/run/wpa_supplicant
network={
       key_mgmt=IEEE8021X
       identity="$_IDENTITY"
       password="$_PASSWORD"
}
EOF
end

{
  'active' => ['wpa2-peap-criteo'],
  'active_wired' => ['wired-criteo']
}.each do |type, templates|
  templates.each do |tmplate|
    execute "activate #{tmplate} in #{type}" do
      command "echo #{tmplate} >> /etc/wicd/encryption/templates/#{type}"
      not_if "grep #{tmplate} /etc/wicd/encryption/templates/#{type}"
    end
  end
end
