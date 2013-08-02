include_recipe 'config::certs'

criteo_dir = '/usr/local/share/criteo'
#cert_path = File.join(criteo_dir, 'vpn.p12')
#Chef::Log.warn "Please add your VPN personal certificate (PKCS12 file) downloaded from https://pki.criteois.com in #{cert_path}"

package 'openconnect'

wrapper = File.join(criteo_dir, 'vpn_csd_wrapper.sh')
cookbook_file wrapper do
  mode '755'
end

home_user = node[:config][:user][:login]
home_dir = File.join('/home', home_user)
hostscan_file = File.join(Chef::Config[:file_cache_path], 'vpn-hostscan.tar.gz')

execute "install Cisco hostscan in home #{home_dir}" do
  command "tar xzf #{hostscan_file}"
  cwd home_dir
  user home_user
  action :nothing
end

remote_file hostscan_file do
  source 'http://isione.criteo.grid/hadoop/vpn/vpn-hostscan.tar.gz'
  checksum '41726880a850b40f46afd3c8f27ae1197a51c21c2f575f9954f492af6609cfa3'
  mode '644'
  notifies :run, "execute[install Cisco hostscan in home #{home_dir}]"
end

file File.join(home_dir, 'vpn_criteo.sh') do
  content <<EOF
sudo openconnect https://fr.criteois.com -c ~/.vpn/vpn-certificate.p12 --csd-user #{home_user} --csd-wrapper #{wrapper} --no-xmlpost --no-passwd --authgroup CriteoVPN  --cafile /etc/ssl/certs/ca-certificates.crt
EOF
  owner home_user
  group home_user
  mode '755'
end
