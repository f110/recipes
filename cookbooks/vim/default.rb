package "vim" do
  action :install
end

directory "/home/vagrant/.vim/bundle" do
  action :create
  owner "vagrant"
  group "vagrant"
end

git "/home/vagrant/.vim/bundle/neobundle.vim" do
  repository "https://github.com/Shougo/neobundle.vim"
  user "vagrant"
end
