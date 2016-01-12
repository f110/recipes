rbenv_bin = "#{node[:home]}/.rbenv/bin/rbenv"
global_ruby_version = node[:rbenv][:versions].first

node[:rbenv][:versions].each do |ver|
  execute "install ruby #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "#{rbenv_bin} install #{ver}"
    not_if "test -d #{node[:home]}/.rbenv/versions/#{ver}"
  end

  execute "install bundler to #{ver}" do
    action :run
    cwd node[:home]
    user node[:user]
    command "RBENV_VERSION=#{ver} #{rbenv_bin} exec gem install bundler"
    not_if "test -f #{node[:home]}/.rbenv/versions/#{ver}/bin/bundle"
  end
end

execute "set global ruby to #{global_ruby_version}" do
  action :run
  cwd node[:home]
  user node[:user]
  command "#{rbenv_bin} global #{global_ruby_version}"
  not_if "#{rbenv_bin} global | grep -qm1 #{global_ruby_version}"
end

execute "rbenv rehash" do
  action :run
  cwd node[:home]
  user node[:user]
  command "#{rbenv_bin} rehash"
end
