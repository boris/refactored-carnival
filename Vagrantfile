# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtuabox" do |vb|
    vb.memory = "4096"
    vb.cpu = "4"
  end

  config.vm.define "ubuntu" do |ub|
    ub.vm.box = "ubuntu/jammy64"
    ub.vm.hostname = "ubuntu-base"
    ub.vm.network "public_network"
  end

  config.vm.define "ubuntu-network" do |un|
    un.vm.box = "ubuntu/jammy64"
    un.vm.hostname = "ubuntu"
    un.vm.network :private_network, ip: "10.11.12.13"
    un.vm.network "forwarded_port", guest: 5000, host:5000
  end

  config.vm.define "databases" do |db|
    db.vm.box = "ubuntu/jammy64"
    db.vm.hostname = "databases"
    db.vm.network "public_network"
    db.vm.provision "shell", path: "provision/databases.sh"
  end

  config.vm.define "gcloud" do |gc|
    gc.vm.box = "ubuntu/jammy64"
    gc.vm.hostname = "gcloud-box"
    gc.vm.provision "shell", path: "provision/gcloud.sh"
  end

  config.vm.define "docker" do |dc|
    dc.vm.box = "ubuntu/jammy64"
    dc.vm.hostname = "docker"
    dc.vm.provision "shell", path: "provision/docker.sh"
  end

  config.vm.define "centos" do |ce|
    ce.vm.box = "centos/7"
    ce.vm.hostname = "centos-dev"
    ce.vm.synced_folder "/home/boris/Code/acloud/python/project", "/home/vagrant/code"
  end

  config.vm.define "test-docker" do |td|
    td.vm.provider "docker" do |d|
      d.build_dir = "./provision/docker/"
      d.remains_running  = true
      d.has_ssh = true
    end
  end

  config.vm.define "cdktf" do |tf|
    tf.vm.box = "ubuntu/jammy64"
    tf.vm.hostname = "cdktf"
    tf.vm.provision "shell", path: "provision/cdktf.sh"
  end

  config.vm.define "debian-multi-disk" do |md|
    md.vm.box = "debian/bullseye64"
    md.vm.hostname  = "vagrant-bquiroz"
    (0..2).each do |i|
      md.vm.disk :disk, name: "disk-#{i}", size: "10GB"
    end
  end

  config.vm.define "k8s" do |k8s|
    k8s.vm.box = "ubuntu/jammy64"
    k8s.vm.hostname = "ubuntu-k8s"
    k8s.vm.synced_folder "/home/boris/Class/LFS258", "/home/vagrant/LFS258"
    k8s.vm.network "private_network", ip: "10.80.0.10"
    k8s.vm.network "public_network", ip: "192.168.1.210"
  end

  config.vm.define "k8s-worker" do |k8sw|
    k8sw.vm.box = "ubuntu/jammy64"
    k8sw.vm.hostname = "ubuntu-k8s-worker"
    k8sw.vm.synced_folder "/home/boris/Class/LFS258", "/home/vagrant/LFS258"
    k8sw.vm.network "private_network", ip: "10.80.0.20"
    k8sw.vm.network "public_network", ip: "192.168.1.220"
  end
end
