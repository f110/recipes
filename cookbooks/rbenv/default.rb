git "/home/#{node["user"]}/.rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  user node["user"]
  not_if "test -d /home/#{node["user"]}/.rbenv"
end

git "/home/#{node["user"]}/.rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  user node["user"]
  not_if "test -d /home/#{node["user"]}/.rbenv/plugins/ruby-build"
end

%w{libssl-dev libreadline-dev zlib1g-dev}.each do |pkg|
  package pkg do
  end
end
