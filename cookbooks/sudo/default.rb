file "/etc/sudoers.d/#{node[:user]}" do
  action :create
  owner "root"
  content <<EOH
#{node[:user]}  ALL=(ALL)   NOPASSWD: ALL
EOH
end
