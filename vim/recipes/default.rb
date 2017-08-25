#
# Cookbook:: vim
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# run the correct linux bootstrap recipe
case node['platform_family']
when 'debian','ubuntu'
  package 'vim'
when 'redhat', 'centos','fedora'
  package 'vim-enhanced'
end
