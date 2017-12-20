Vagrant.configure('2') do |config|
  RAM = 2048

  config.vm.box = 'debian/stretch64'
  config.vm.guest = :debian

  config.vm.provider 'virtualbox' do |vbox|
    vbox.memory = RAM
  end

  config.vm.define 'kube-master' do |machine|
    machine.vm.hostname = 'kube-master'
    machine.vm.network 'private_network', ip: '192.168.60.10', netmask: '255.255.255.0'
  end

  config.vm.define 'kube-node' do |machine|
    machine.vm.hostname = 'kube-node'
    machine.vm.network 'private_network', ip: '192.168.60.11', netmask: '255.255.255.0'
  end

  config.vm.provision 'shell', inline: 'echo hello'
end
