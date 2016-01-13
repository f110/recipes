# HOW TO RUN

```
bash ./bootstrap.sh
vagrant up
bundle exec itamae-secrets newkey --base=./secret --method=aes-passphrase
bundle exec itamae ssh -h 192.168.50.12 -u vagrant -j vagrant.json roles/dev.rb -i ~/.vagrant.d/insecure_private_key
```
