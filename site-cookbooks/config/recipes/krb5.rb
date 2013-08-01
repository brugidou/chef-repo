
unless node[:domain] == 'criteois.lan'
  Chef::Log.warn "Your domain name '#{node[:domain]}' does not match 'criteois.lan'"
  Chef::Log.warn "Kerberos requires the default realm to be CRITEOIS.LAN"
  Chef::Log.warn "Please use 'dpkg-reconfigure krb5-config' to set up the default realm to CRITEOIS.LAN"
end

package 'krb5-user'
package 'libpam-krb5'
package 'libpam-ccreds'
