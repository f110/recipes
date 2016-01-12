git "/home/#{node["user"]}/dot-files" do
  repository "git@bitbucket.org:rightoverture/dot-files.git"
  action :sync
  user node[:user]
  not_if "test -d /home/#{node["user"]}/.git"
end

execute "move .git directory" do
  action :run
  command "mv /home/#{node["user"]}/dot-files/.git /home/#{node["user"]}"
  not_if "test -d /home/vagrant/.git"
end

execute "extract dot-files" do
  action :run
  command "git reset --hard"
  user node[:user]
  cwd node[:home]
  not_if "test -e /home/#{node["user"]}/.zshrc"
end

execute "init submodule" do
  action :run
  command "git submodule init && git submodule update"
  user node[:user]
  cwd node[:home]
  not_if "test -f #{node[:home]}/.zsh/zaw/zaw.zsh"
end
