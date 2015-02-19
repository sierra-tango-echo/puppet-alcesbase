################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::services (
  $profile=$alcesbase::profile
)
{
  case $profile {
    'compute': {
      if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs','iptables','ip6tables']
      } else {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs','iptables','ip6tables']
      }
    }
    'login': {
      if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs']
      } else {
        $enable_services=[]
        $disable_services=['kdump','autofs','cpuspeed']
      }
    }
    'storage': {
      if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs']
      } else {
        $enable_services=['kdump']
        $disable_services=['autofs','cpuspeed']
      }
    }
    'headnode': {
      if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs','bluetooth']
      } else {
        $enable_services=['kdump','cpuspeed']
        $disable_services=['autofs','bluetooth','iptables','ip6tables']
      }
    }
    'service': {
    if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs','bluetooth']
      } else {
        $enable_services=['kdump','cpuspeed']
        $disable_services=['autofs','bluetooth']
      }
    }
    'generic': {
    if str2bool($is_virtual) {
        $enable_services=[]
        $disable_services=['cpuspeed','kdump','autofs','bluetooth']
      } else {
        $enable_services=['kdump','cpuspeed']
        $disable_services=['autofs','bluetooth']
      }
    }
    default: {
      fail("unrecognised profile")
    }
  }

  service {$enable_services:
    enable=>true
  }
  service {$disable_services:
    enable=>false
  }

}
