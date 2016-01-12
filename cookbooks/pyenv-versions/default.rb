pyenv_bin = "#{node[:home]}/.pyenv/bin/pyenv"
global_python_version = node[:pyenv][:versions].first

node[:pyenv][:versions].each do |ver|
  execute "install python #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "#{pyenv_bin} install #{ver}"
    not_if "test -d #{node[:home]}/.pyenv/versions/#{ver}"
  end
end

execute "set global python to #{global_python_version}" do
  action :run
  cwd node[:home]
  user node[:user]
  command "#{pyenv_bin} global #{global_python_version}"
  not_if "#{pyenv_bin} global | grep -qm1 #{global_python_version}"
end

execute "pyenv rehash" do
  action :run
  cwd node[:home]
  user node[:user]
  command "#{pyenv_bin} rehash"
end
