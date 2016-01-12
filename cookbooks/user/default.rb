user node["user"] do
  action :create
  shell "/usr/bin/zsh"
end

directory "/home/#{node["user"]}" do
  action :create
  user node[:user]
  owner node[:user]
end

file "/home/#{node["user"]}/.ssh/config" do
  action :create
  user node[:user]
  owner node[:user]
  content <<EOH
Host bitbucket.org
    StrictHostKeyChecking no
    IdentityFile ~/.ssh/id_rsa.github
EOH
end

file "/home/#{node["user"]}/.ssh/id_rsa" do
  action :create
  content node[:secrets][:ssh_key]
  mode "0400"
end

file "/home/#{node["user"]}/.ssh/id_rsa.pub" do
  action :create
  content "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0QBscaIbkhxAbAV30tnnkn9yUnP10GmCtHA1e3m7SWVLJ7Zd/XJ6gSyJP3jFwiPIFt51nSLLwaHvbS65/aWY8y99WgPuvCFevrHOL6xWJ5T8A7aeisF40GiOwv+EdRLMgqcsFd9CJkeh+dhMw2HCMaY6BCsBpsDC+nSHyRnvhpu70slPUybBHPCM8cjceR8hAjGQ++UkA5mCh5aw8jUzy4t8FInM7flRp4RHBBqtP4rIcG+Oytf4iic44khFAZI/KSeBCtzK69aPEMDrc84PbMC2wuGkImW0hGjteHy3ez4Rm8pSoWiJAG3IqjXDHbBvaN2H3XLRqD0bimxlyi415"
  mode "0644"
end

file "/home/#{node["user"]}/.ssh/id_rsa.github" do
  action :create
  content node[:secrets][:ssh_key_git]
  mode "0400"
end

file "/home/#{node["user"]}/.ssh/id_rsa.github.pub" do
  action :create
  content "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCydgzWhraB1ylogfYlA0fxv/yny29CwMT90RkZ9N/DLz4hZDvaCQSBKc9QLATmrjGebgddK9Z4KSvhGkjyZMcAQMtPns350oHHCW3XSesEhPr6ELZxHOXR7SgBsBx4tMHW3TXfByOUn3P27X1bA12wE9yKx6y5zyhfEoqeRCB7vUyQ/eWRKS05qL49S2YwTsbUAoLR7w/q/++Ny0zR5zmOYJvqnkEt/cQVS0eDAkyccAT8n4cpwZafHanFSaX/XTOMf/Dw9CE39ECOQykkCVZdugnS4J/g+jR7jRk/JfoAaBcWXRbX8mboCE1FiI5PsIyqOpubZt5xjykDaFzcVSvz"
  mode "0644"
end
