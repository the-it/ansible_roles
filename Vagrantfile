Vagrant.configure("2") do |config|
  config.vm.define "devbox" do |dev|
      config.vm.box = "chenhan/ubuntu-desktop-20.04"
      dev.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.cpus = 2
        vb.memory = "3072"
        # more customization options here: https://www.virtualbox.org/manual/ch08.html
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--vram", "64"]
        vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      end
      dev.vm.provision "shell", path: "vagrant/scripts/pre_provision.sh"
      dev.vm.provision "shell", inline: <<-SHELL
        su vagrant -c "cd /vagrant && ansible-playbook devbox.yml"
      SHELL
   end
end
