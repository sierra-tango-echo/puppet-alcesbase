################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::alces (

)
{
  file {'/var/lib/alces/bin/site.sh':
    mode=>0750,
    owner=>'alces',
    group=>'alces',
    content=>template("alcesbase/alces/site_${alcesbase::profile}.sh"),
  }
  file {'/var/lib/alces/etc/':
    ensure=>directory,
    owner=>'alces',
    group=>'alces',
    mode=>0750,
  }

  file {'/var/log/alces':
    ensure=>directory, 
    owner=>'root',
    group=>'root',
    mode=>0750,
  }
}
