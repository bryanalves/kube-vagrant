Vagrant.configure('2') do |config|
  NODES = 1
  RAM = 2048

  config.vm.box = 'debian/contrib-stretch64'
  config.vm.guest = :debian

  config.vm.provider 'virtualbox' do |vbox|
    vbox.memory = RAM
  end

  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  config.vm.provision 'shell', path: './provision/docker.sh'

  config.vm.define 'kube-master' do |machine|
    ip = '192.168.60.10'
    machine.vm.hostname = 'kube-master'
    machine.vm.network 'private_network', ip: ip, netmask: '255.255.255.0'

    machine.vm.provision 'shell', path: './provision/kubeadm.sh', args: ip
    machine.vm.provision 'shell', path: './provision/setup_master.sh'
  end

  (1..NODES).each do |node|
    config.vm.define "kube-node-#{node}" do |machine|
      ip = "192.168.60.#{11 + node}"
      machine.vm.hostname = "kube-node-#{node}"
      machine.vm.network 'private_network', ip: ip, netmask: '255.255.255.0'

      machine.vm.provision 'shell', path: './provision/kubeadm.sh', args: ip
      machine.vm.provision 'shell', path: './provision/setup_node.sh'
    end
  end
end
