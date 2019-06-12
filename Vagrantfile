Vagrant.configure("2") do |config|
  config.vm.define "devbox" do |dev|
      config.vm.box = "ubuntu/disco64"
      dev.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.cpus = 2
        vb.memory = "2048"
        # more customization options here: https://www.virtualbox.org/manual/ch08.html
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--vram", "64"]
        # vb.customize ["modifyvm", :id, "--uart1", "off" ]
        vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
      end
      dev.vm.provision "shell", path: "vagrant/scripts/pre_provision.sh"
      dev.vm.provision "shell", inline: <<-SHELL
        sudo apt-get install -y ubuntu-desktop
      SHELL
      dev.vm.provision "shell", inline: <<-SHELL
        su vagrant -c "cd /vagrant && ansible-playbook laura_devbox.yml"
      SHELL
   end
end
