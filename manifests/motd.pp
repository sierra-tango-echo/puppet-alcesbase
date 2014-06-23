################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::motd (
  $clustername=$alcesbase::clustername,
)
{


  $motd_template=multitemplate(
            "alcesbase/dynamic/$alcesbase::machine/motd.erb",
            "alcesbase/dynamic/$alcesbase::profile/motd.erb",
            "alcesbase/dynamic/$alcesbase::role/motd.erb",
            "alcesbase/dynamic/generic/motd.erb")

  file {'/etc/motd':
        ensure=>present,
        mode=>0644,
        owner=>'root',
        group=>'root',
        content=>$motd_template
  }
}
