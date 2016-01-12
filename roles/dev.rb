require 'itamae/secrets'
node[:secrets] = Itamae::Secrets(File.join(__dir__, "../secret"))
node[:home] = "/home/#{node["user"]}"

include_recipe "../cookbooks/zsh/default"
include_recipe "../cookbooks/user/default"
include_recipe "../cookbooks/vim/default"
include_recipe "../cookbooks/git/default"
include_recipe "../cookbooks/tig/default"
include_recipe "../cookbooks/tmux/default"
include_recipe "../cookbooks/font/default"
include_recipe "../cookbooks/build-essential/default"
include_recipe "../cookbooks/golang/default"
include_recipe "../cookbooks/peco/default"

include_recipe "../cookbooks/dot-files/default"
include_recipe "../cookbooks/plenv/default"
include_recipe "../cookbooks/plenv-versions/default"
include_recipe "../cookbooks/rbenv/default"
include_recipe "../cookbooks/rbenv-versions/default"
include_recipe "../cookbooks/pyenv/default"
include_recipe "../cookbooks/pyenv-versions/default"
