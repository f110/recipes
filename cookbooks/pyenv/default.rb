git "/home/#{node["user"]}/.pyenv" do
  repository "git://github.com/yyuu/pyenv.git"
  user node["user"]
  not_if "test -d /home/#{node["user"]}/.pyenv"
end
