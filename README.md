# VMworld 2017 Demo

![](http://blogs.air-watch.com/wp-content/uploads/2017/04/VMworld-2017.jpg)

These are my notes and the commands to demo `knife-vcenter` at VMworld 2017.

## Differences

`knife-vsphere`: https://github.com/chef-partners/knife-vsphere/blob/master/lib/chef/knife/vsphere_vm_list.rb#L63-L69

`knife-vcenter`: https://github.com/chef/knife-vcenter/blob/master/lib/chef/knife/vcenter_vm_list.rb#L36-L64

knife-vcenter has been written with [knife-cloud][knifecloud] an the driver. This allows for
multiple helper methods that `knife-vsphere` has to recreate. Also the `vcenter` code is designed for
the **create**, **list**, **bootstrap**, and **destroy**.

## knife

The bash commands for spinning up a VM in your local SDDC.
```bash
SDDC=local bundle exec knife vcenter vm clone local01 --targethost 172.16.20.42 \
--ssh-user root --ssh-password admini --datacenter Datacenter --template \
centos7-template -N local01
SDDC=local bundle exec knife vcenter vm delete local01 -N local01 --purge -y
```

The bash commands for spinning up a VM in your AWS SDDC.
```bash
SDDC=aws bundle exec knife vcenter vm clone aws01 --folder TODO --ssh-user root \
--ssh-password admini --datacenter TODO --template centos7-template -N aws01
SDDC=aws bundle exec knife vcenter vm delete aws01 -N aws01 --purge -y
```

## kitchen

Change to the remove `yml` for test-kitchen.
```bash
export KITCHEN_YAML=.kitchen.vcenter.yml
```

Use the default settings for the local SDDC.
```bash
kitchen list
kitchen verify
```

Use ENV vars to override to go to the AWS SDDC.
```bash
VCENTER_USER=TODO VCENTER_PASSWORD=TODO VCENTER_HOST=TODO AWS=TODO kitchen list
VCENTER_USER=TODO VCENTER_PASSWORD=TODO VCENTER_HOST=TODO AWS=TODO kitchen verify
```

[knifecloud]: https://github.com/chef/knife-cloud
