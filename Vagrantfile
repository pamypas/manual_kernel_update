MACHINES = {
  :"kernel-update-homework" => {
              :box_name => "jikarto/centos-7-5",
              :cpus => 2,
              :memory => 1024,
              :net => [],
              :forwarded_port => []
            }
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.box = "jikarto/centos-7-5"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vbguest.auto_update = false
    config.vm.box_version = "1.0"
    config.vm.define boxname do |box|
      box.vm.box = boxconfig[:box_name]
      box.vm.host_name = boxname.to_s
      if boxconfig.key?(:net)
        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end
      end
      if boxconfig.key?(:forwarded_port)
        boxconfig[:forwarded_port].each do |port|
          box.vm.network "forwarded_port", port
        end
      end
      box.vm.provider "virtualbox" do |v|
        v.memory = boxconfig[:memory]
        v.cpus = boxconfig[:cpus]
      end
    end
  end
end
