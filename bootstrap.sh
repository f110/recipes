#!/usr/bin/env bash
set -e

if [ ! -f authorized_keys ]; then
    cp ~/.ssh/id_rsa.pub authorized_keys
end
docker build -t f110/xenial .
