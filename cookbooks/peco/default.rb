peco_url = "https://github.com/peco/peco/releases/download/#{node["peco"]["version"]}/peco_linux_amd64.tar.gz"
temporary_file = "/tmp/peco.tar.gz"

http_request temporary_file do
  action :get
  url peco_url
  not_if "which peco && peco --version | grep \"#{node["peco"]["version"]}\""
end

execute "extract peco" do
  action :run
  command "tar xfz #{temporary_file} -C /tmp"
  user "root"
  not_if "which peco && peco --version | grep \"#{node["peco"]["version"]}\""
end

execute "move peco" do
  action :run
  command "mv /tmp/peco_linux_amd64/peco /usr/local/bin"
  user "root"
  not_if "which peco && peco --version | grep \"#{node["peco"]["version"]}\""
end
