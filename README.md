*This project has been created as part of 42 curriculum by ahetru*

# Inception

TODO

## Description

TODO

## Instructions

### Prerequisites:

- Install build essential (needed for Makefile)
```sh
sudo apt install build-essential
```

- Install docker dependencies:

```sh
sudo apt install -y ca-certificates curl gnupg lsb-release

```

- Add Docker official gpg key:

```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

- Add the Docker repository to APT sources
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- Install Docker Engine and Docker Compose:

```sh
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```


## Ressources

### Optional:

Programs that come handy during development:
vim / tree


## Project Description
TODO:
