apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  distribution 'testing'
  components ['non-free']
  keyserver 'keyserver.ubuntu.com'
  key 'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
end
