# HOW TO RUN

```
bash ./bootstrap.sh
docker run --privileged -d -p 2222:22 f110/xenial
bundle exec itamae-secrets newkey --base=./secret --method=aes-passphrase
bundle exec itamae ssh -h localhost -u docker -p 2222 -j docker.json roles/dev.rb
```

for vagrant

```
bundle exec itamae ssh -h localhost -p 2222 -u ubuntu -i ./.vagrant/machines/default/virtualbox/private_key -j node.json roles/dev.rb
```}
