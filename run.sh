#!/bin/bash

### Put this bash file in the directory that you want PyPI to be setup ###

# Pre-create existing server directories
mkdir -p $(pwd)/data

# Add password file
echo 'YOUR_USERNAME:YOUR_HASHED_PASSWORD_HERE' > $(pwd)/data/.htpasswd

# Make permissions more flexible to allow docker container to write to it
chmod a+rwx -R $(pwd)/data

# -v: mounts docker internal directories to host directory, (:z) i've no idea what it does
# -P: this is to apply authentication to the following directories, otherwise can't upload
docker run -p 80:8080 \
    -v $(pwd)/data/packages:/data/packages:z \
    -v $(pwd)/data/.htpasswd:/data/.htpasswd:z \
    pypiserver/pypiserver:latest \
    -P .htpasswd packages
