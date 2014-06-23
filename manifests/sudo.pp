################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::sudo (
  
)
{
  $sudo_template=multitemplate(
            "alcesbase/dynamic/$alcesbase::machine/sudoers.erb",
            "alcesbase/dynamic/$alcesbase::profile/sudoers.erb",
            "alcesbase/dynamic/$alcesbase::role/sudoers.erb",
            "alcesbase/dynamic/generic/sudoers.erb")

  package {'sudo':
    ensure=>installed
  }

  file {'/etc/sudoers':
    ensure=>present,
    mode=>0440,
    owner=>'root',
    group=>'root',
    content=>$sudo_template,
    require=>Package['sudo'],
  }
}
