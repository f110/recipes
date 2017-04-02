execute "add fingerprint of bitbucket.org to known_hosts" do
  action :run
  command "ssh-keyscan -H bitbucket.org >> #{node[:home]}/.ssh/known_hosts"
  user node[:user]
  cwd node[:home]
  not_if "ssh-keygen -F bitbucket.org"
end

git "/home/#{node["user"]}/dot-files" do
  repository "git@bitbucket.org:rightoverture/dot-files.git"
  action :sync
  user node[:user]
  not_if "test -d #{node[:home]}/.git"
end

execute "move .git directory" do
  action :run
  command "mv #{node[:home]}/dot-files/.git #{node[:home]}"
  not_if "test -d #{node[:home]}/.git"
end

execute "extract dot-files" do
  action :run
  command "git reset --hard"
  user node[:user]
  cwd node[:home]
  not_if "test -e #{node[:home]}/.zshrc"
end

execute "init submodule" do
  action :run
  command "git submodule init && git submodule update"
  user node[:user]
  cwd node[:home]
  not_if "test -f #{node[:home]}/.zsh/zaw/zaw.zsh"
end
