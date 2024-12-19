#!/bin/sh

GIT_SRC=https://github.com/reptiloid
INSTALL_DIR=DebInstall

install_deb_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y git ansible
}

clone_ansible_scripts_repo() {
	echo
	printf '%s\n' "Cloning Ansible Scripts" && sleep 1
	git clone "$GIT_SRC"/deb12ansible.git "$INSTALL_DIR"
}

run_ansible_playbook() {
	ansible-playbook ~/"$INSTALL_DIR"/my-setup-local.yml
}

main() {
	install_deb_pkgs
	clone_ansible_scripts_repo
	run_ansible_playbook
}

time main
