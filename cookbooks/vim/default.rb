package "vim" do
  action :install
end

directory "#{node[:home]}/.vim/bundle" do
  action :create
  user node["user"]
  owner node["user"]
  group node["user"]
end

git "#{node[:home]}/.vim/bundle/neobundle.vim" do
  repository "https://github.com/Shougo/neobundle.vim"
  user node[:user]
  not_if "test -d #{node[:home]}/.vim/bundle/neobundle.vim"
end
