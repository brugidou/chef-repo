apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  keyserver 'keyserver.ubuntu.com'
  key '94558F59'
end
