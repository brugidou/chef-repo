#This recipe setup a medium chef workstation
#
%w(chef berkshelf chefspec knife-spec librarian-chef).each do |g|
  gem g
end
