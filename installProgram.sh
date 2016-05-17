sudo apt install vim
sudo apt install redis-server
sudo apt install redis-tools
sudo apt install docker.io
sudo apt install mongodb-server
sudo apt install mongodb-clients
sudo apt install golang-go
mkdir ~/caicloud
export GOPATH=~/caicloud
cd ~/caicloud
go get github.com/tools/godep
echo 'export PATH=$PATH:~/caicloud/bin' >> ~/.bashrc