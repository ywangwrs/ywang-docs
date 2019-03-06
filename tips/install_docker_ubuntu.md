# Install Docker - Ubuntu

## Remove previous installations
Reference:
  * https://docs.docker.com/install/linux/docker-ce/ubuntu/
```
sudo apt-get remove docker-ce
```

## Install latest docker-ce
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

# Install docker-compose
Reference:
  * https://github.com/docker/compose/releases
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
# Solving Docker permission denied while trying to connect to the Docker daemon socket
Reference:
  * https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/

Run the following command and relogin:
```
sudo usermod -a -G docker $USER
```
