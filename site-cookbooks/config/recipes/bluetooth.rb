package 'bluetooth'
package 'blueman'

cert_path = '/usr/local/share/criteo/criteo_lan.cer'

Chef::Log.warn <<EOF unless File.exist? cert_path
Wifi certificate missing:

IMPORTANT: put the Criteo wifi certificate in #{cert_path}
This is necessary for the CRITEO_CORP wifi to work.

EOF
