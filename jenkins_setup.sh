function printMsg(){
   printf "\n$(tput setaf 3)####$(tput sgr0) $1 $(tput setaf 3)####$(tput sgr0)\n"
}
printMsg 'Adding Jenkins stable update keys to repo'

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

printMsg 'Updating global install repo'
echo -e "$(tput setaf 3)Not showing all techie techie stuff$(tput sgr0)"
sudo apt-get update >> /dev/null

printMsg 'Installing Jenkins'
sudo apt-get install jenkins

printMsg 'Checking Jenkins Server'
status=$(sudo systemctl is-active jenkins)
echo -e "Jenkins Server: $(tput setaf 6)$status$(tput sgr0)"
if [ "$status" == "inactive" ]; then
echo -e "$(tput setaf 2 && tput bold)Starting Jenkins$(tput sgr0)"
sudo systemctl restart jenkins
fi

printMsg 'Generating Ext IP address'
ip=$(wget -q -O - "http://myexternalip.com/raw")
echo -e "Open this at browser\n$ip:8080\n"
