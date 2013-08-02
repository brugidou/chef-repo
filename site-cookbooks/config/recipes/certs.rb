execute 'update-ca-certificates' do
   action :nothing
end

remote_directory '/usr/local/share/ca-certificates' do
  notifies :run, 'execute[update-ca-certificates]'
end
