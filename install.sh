#!/bin/sh

GIT_SRC=https://github.com/reptiloid

install_git_ansible_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y git ansible
}

clone_ansible_scripts_repo() {
	echo
	printf '%s\n' "Cloning Ansible Scripts" && sleep 1
	git clone "$GIT_SRC"/deb12ansible.git DebInstall
}


start_ansible_test_playbook() {
	ansible-playbook ~/DebInstall/Ansible-Local.yml
}

main() {
	install_git_ansible_pkgs
	clone_ansible_scripts_repo
	start_ansible_test_playbook
}

time main
