remote_directory "/home/vagrant/.git" do
  source "dot-files/.git"
  owner "vagrant"
  group "vagrant"
end

execute "move .git directory" do
  action :run
  command "mv /home/vagrant/dot-files/.git /home/vagrant"
  not_if "test -d /home/vagrant/.git"
end

execute "extract dot-files" do
  action :run
  command "git reset --hard"
  user "vagrant"
  cwd "/home/vagrant"
  not_if "test -e /home/vagrant/.zshrc"
end
