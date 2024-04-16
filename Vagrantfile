ENV["VAGRANT_EXPERIMENTAL"] = "disks"

Vagrant.configure("2") do |config|

    os = "rockylinux/9"
    ho_net = "192.168.100"
    config.vm.synced_folder '.', '/vagrant', disabled: true
	
	#Configurare FiiPractic-App
	
	config.vm.define :app do |app_config|
        app_config.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.cpus = 2
            vb.name = "FiiPractic-App"
        end
        app_config.vm.host_name = 'app.fiipractic.lan'
        app_config.vm.box = "#{os}"
        app_config.vm.network "private_network", ip: "#{ho_net}.10"
        app_config.vm.provision "shell", inline: <<-SHELL
	    echo "root:fiipractic" | chpasswd
	    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
        systemctl restart sshd
		yum install -y git
		yum install -y wget
		yum install -y vim
        SHELL
    end
	
	#Configurare FiiPractic-GitLab
	
	#config.vm.define :gitlab do |gitlab_config|
	# 	...	aici vor fi adaugate setarile 
	#end

    config.vm.define "FiiPractic-GitLab" do |gitlab_config|
        gitlab_config.vm.box = "rockylinux/9"
        gitlab_config.vm.hostname = "gitlab.fiipractic.lan"
        gitlab_config.vm.network "private_network", ip: "192.168.100.20"
    
        gitlab_config.vm.provider "virtualbox" do |vb|
          vb.memory = "4096"
          vb.cpus = 4
        end
        # gitlab_config.vm.disk :disk, size: "20GB", primary: true
        gitlab_config.vm.disk :disk, size: "30GB", primary: true
        gitlab_config.vm.provision "shell", inline: <<-SHELL
	    echo "root:fiipractic" | chpasswd
	    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
        systemctl restart sshd
		yum install -y git
		yum install -y wget
		yum install -y vim
        SHELL
      end

end
