git "#{node[:home]}/dev/src/github.com/neovim/neovim" do
  repository "git@github.com:neovim/neovim.git"
  action :sync
  user node[:user]
  not_if "test -d #{node[:home]}/dev/src/github.com/neovim/neovim"
end

execute "build neovim" do
  action :run
  command "#{node[:home]}/local/bin/build_neovim"
  user node[:user]
  not_if "test -f #{node[:home]}/local/bin/nvim"
end
