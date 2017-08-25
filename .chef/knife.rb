current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                "jjasghar"
client_key               "/Users/jjasghar/.chef/jjasghar.pem"
validation_client_name   ENV['CHEF_HOSTED_ORG_VAILDATOR']
validation_key           "#{current_dir}/#{ENV['CHEF_HOSTED_ORG_VAILDATOR']}.pem"
chef_server_url          ENV['CHEF_HOSTED_ORG']
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cache_path               File.expand_path(File.dirname(__FILE__))

if ENV['SDDC'] == 'local'
  knife[:vcenter_host] = ENV['LOCAL_VCENTER_HOST']
  knife[:vcenter_username] = "administrator@vsphere.local"
  knife[:vcenter_password] = ENV['LOCAL_VCENTER_PASSWORD']
  knife[:vcenter_disable_ssl_verify] = true # if you want to disable SSL checking
end

if ENV['SDDC'] == 'AWS'
  knife[:vcenter_host] = ENV['AWS_VCENTER_HOST']
  knife[:vcenter_username] = ENV['AWS_VCENTER_USERNAME']
  knife[:vcenter_password] = ENV['AWS_VCENTER_PASSWORD']
  knife[:vcenter_disable_ssl_verify] = false
end
