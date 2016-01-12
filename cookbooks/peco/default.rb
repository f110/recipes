execute "install peco" do
  action :run
  cwd node[:home]
  user node[:user]
  command "zsh -c 'go get github.com/peco/peco/cmd/peco'"
  not_if "test -f #{node[:home]}/local/go/bin/peco"
end
