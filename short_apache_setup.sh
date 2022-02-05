function printMsg(){
   printf "\n$(tput setaf 3)####$(tput sgr0) $1 $(tput setaf 3)####$(tput sgr0)\n"
}
printMsg 'Installing Apache'
sudo apt install apache2
sudo ufw allow 'Apache'

printMsg 'Setting Config Files'
sudo mkdir /var/www/be_dbit
echo "Hello" | sudo tee -a /var/www/be_dbit/index.html > /dev/null
cd /etc/apache2/sites-available
sudo wget -q --spider https://raw.githubusercontent.com/Dixzz/devops_git/main/apache_test.conf -O /etc/apache2/sites-available/apache_test.conf
sudo a2ensite apache_test.conf
sudo systemctl restart apache2

printMsg 'Success'
ip=$(wget -q -O - "http://myexternalip.com/raw")

echo -e "Connect Apache at $ip:80"
