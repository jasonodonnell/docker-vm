# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('servers.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    servers.each do |servers|
        config.vm.define servers["name"] do |srv|
            srv.vm.box = servers["box"]
            srv.vm.network "private_network", ip: servers["ip"]
            srv.vm.hostname = servers["hostname"]
            srv.vm.provider :virtualbox do |vb|
                vb.name = servers["name"]
                vb.memory = servers["ram"]
            end

            srv.vm.provision "ansible" do |ansible|
                ansible.playbook = "playbook.yml"
                ansible.tags="all"
                ansible.extra_vars = {
                    docker_compose_install: true 
                }
            end
        end
    end
end
