################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::envmodules (

)
{
  package {'environment-modules':
    ensure=>installed
  }
  file {'/etc/profile.d/modules.sh':
    ensure=>present,
    mode=>0644,
    owner=>'root',
    group=>'root',
    source=>'puppet:///modules/alcesbase/envmodules/modules.sh',
    require=>Package['environment-modules']
  }
  file {'/etc/profile.d/modules.csh':
    ensure=>present,
    mode=>0644,
    owner=>'root',
    group=>'root',
    source=>'puppet:///modules/alcesbase/envmodules/modules.csh',
    require=>Package['environment-modules']
  }
}
