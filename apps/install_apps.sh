#! /bin/bash
# Description : This script will install Ansible, Terraform, Vagrant or Virtualbox
# Last modification : 03/04/2022

# Source : https://www.virtualbox.org/wiki/Downloads
# Source : https://www.vagrantup.com/downloads
# Source : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
# Source : https://www.terraform.io/downloads

error() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

info() {
  printf '\E[34m'; echo "$@"; printf '\E[0m'
}

if [[ $EUID > 0 ]]; then
    error "This script should be run using sudo or as the root user"
    exit 1
fi

function i_utils {
  echo
  echo "Installation of wget, gnupg, software-properties-common and curl"
  echo
  apt install -y wget gnupg software-properties-common curl
}

function i_ansible {
  echo
  info "Installation of Ansible"
  echo
  echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" | tee /etc/apt/sources.list.d/ansible.list
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  ansible=true
}

function i_terraform {
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
  echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
  alias tf='terraform'

  if [ -f ~/.bash_aliases ]; then echo "alias tf='terraform'" >> ~/.bash_aliases; fi
  if [ -f ~/.zshrc ]; then echo "alias tf='terraform'" >> ~/.zshrc; fi
  terraform=true
}

function i_vagrant {
  echo
  info "Installation of Vagrant"
  echo
  echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
  vagrant=true
}

function i_virtualbox {
  echo
  info "Installation of Virtualbox"
  echo
  echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | tee /etc/apt/sources.list.d/virtualbox.list
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
  virtualbox=true
}

function yes_or_no {
  while true; do
    read -p "$* [Y/n]: " yn
      case $yn in
        [YyOo]* | "") return 0 ;;
        [Nn]*) error "Aborted" ; return 1 ;;
      esac
  done
}

function menu {
  echo
  yes_or_no "Are you ready to proceed (install utilities) ?" && i_utils || exit 1
  echo
  yes_or_no "Do you want to install Ansible ?" && i_ansible
  yes_or_no "Do you want to install Docker ?" && docker=true
  yes_or_no "Do you want to install Flatpak ?" && flatpak=true
  yes_or_no "Do you want to install Terraform ?" && i_terraform
  yes_or_no "Do you want to install Virtualbox ?" && i_virtualbox
  yes_or_no "Do you want to install Vagrant ?" && i_vagrant
}

echo
info "This script will install Ansible, Terraform, Vagrant or Virtualbox belongs to your choices"

menu

packages=""
if [ $ansible ]; then packages+="ansible "; fi
if [ $docker ]; then packages+="docker.io "; fi
if [ $flatpak ]; then packages+="flatpak gnome-software-plugin-flatpak "; fi
if [ $terraform ]; then packages+="terraform "; fi
if [ $virtualbox ]; then packages+="virtualbox-6.1 "; fi
if [ $vagrant ]; then packages+="vagrant "; fi

echo $packages
if [ ! -z "$packages" ]
then
    apt update
    apt install -y $packages
else
    error "Nothing were installed"
    echo
fi

if [ $terraform ]; then terraform -install-autocomplete; fi

if [ $docker ]
then 
systemctl enable docker
systemctl start docker
fi

if [ $flatpak ]
then
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

info "Done"

exit 0
