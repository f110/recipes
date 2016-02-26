plenv_bin = "#{node[:home]}/.plenv/bin/plenv"
global_perl_version = node[:plenv][:versions].first

node[:plenv][:versions].each do |ver|
  execute "install perl #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "#{plenv_bin} install #{ver}"
    not_if "test -d #{node[:home]}/.plenv/versions/#{ver}"
  end

  execute "install cpanm to #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "PLENV_VERSION=#{ver} #{plenv_bin} install-cpanm"
    not_if "test -f #{node[:home]}/.plenv/versions/#{ver}/bin/cpanm"
  end

  execute "install carton to #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "PLENV_VERSION=#{ver} #{plenv_bin} exec cpanm Carton"
    not_if "test -f #{node[:home]}/.plenv/versions/#{ver}/bin/carton"
  end
end

execute "set global perl" do
  action :run
  cwd node[:home]
  user node[:user]
  command "#{plenv_bin} global #{global_perl_version}"
  not_if "#{plenv_bin} global | grep -qm1 #{global_perl_version}"
end
