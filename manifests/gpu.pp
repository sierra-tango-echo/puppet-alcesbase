################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::gpu (
  $nvidia
)
{

  if $nvidia {
    file {'/etc/init.d/alces-nvidia':
      ensure=>present,
      mode=>0755,
      owner=>'root',
      group=>'root',
      source=>'puppet:///modules/alcesbase/gpu/alces-nvidia.init'
    }
    service {'alces-nvidia':
      enable=>true,
      require=>File['/etc/init.d/alces-nvidia']
    }
  }
}
