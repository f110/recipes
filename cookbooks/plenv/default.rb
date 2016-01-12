git "/home/#{node["user"]}/.plenv" do
  repository "git://github.com/tokuhirom/plenv.git"
  user node["user"]
  not_if "test -d /home/#{node["user"]}/.plenv"
end

git "/home/#{node["user"]}/.plenv/plugins/perl-build" do
  repository "git://github.com/tokuhirom/Perl-Build.git"
  user node["user"]
  not_if "test -d /home/#{node["user"]}/.plenv/plugins/perl-build"
end
