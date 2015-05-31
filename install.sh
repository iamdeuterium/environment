# install ansible
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ]
then
  sudo apt-get install software-properties-common
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install ansible
fi

# run ansible
if [ $(sudo -l | grep -c "NOPASSWD") -eq 0 ]
then
  ansible-playbook -i ansible/hosts ansible/site.yml --ask-sudo-pass
else
  ansible-playbook -i ansible/hosts ansible/site.yml
fi
