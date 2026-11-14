log=/tmp/http.log
source non-fun-reqire.sh

echo -e "\e[36m create elk repo file\e[0m"
cp elk.repo /etc/yum.repos.d/elk.repo  &>>${log}
func_exit_status

echo -e "\e[36mStarting elasticsearch Service\e[0m"
systemctl enable elasticsearch &>>${log}
systemctl start elasticsearch &>>${log}
func_exit_status

echo -e "\e[36m service status\e[0m"
if systemctl is-active --quiet elasticsearch; then
    echo -e "\e[32m elasticsearch Service is Running - OK\e[0m"
else
    echo "\e[31m elasticsearch Service is NOT running - FAILED\e[0m"
    exit 1   # Stop script if service is not running
fi


