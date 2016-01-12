execute "install ghq" do
  action :run
  cwd node[:home]
  user node[:user]
  command "zsh -c 'go get github.com/motemen/ghq'"
  not_if "test -f #{node[:home]}/local/go/bin/ghq"
end
