################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::userprofile (
  $clustername=$alcesbase::clustername
)
{
  file {'/etc/profile.d/alces-profiles.sh':
        ensure=>present,
        mode=>0644,
        owner=>'root',
        group=>'root',
        source=>'puppet:///modules/alcesbase/profile/alces-profiles.sh'
  }
  file {'/etc/profile.d/alces-profiles.csh':
        ensure=>present,
        mode=>0644,
        owner=>'root',
        group=>'root',
        source=>'puppet:///modules/alcesbase/profile/alces-profiles.csh'
  }
}
