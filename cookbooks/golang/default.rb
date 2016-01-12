package "golang" do; end

directory "#{node[:home]}/local/go" do
  action :create
  user node[:user]
  owner node[:user]
end
