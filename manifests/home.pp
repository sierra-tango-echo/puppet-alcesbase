################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::home
{
  group {'alces':
    ensure=>present,
    gid=>500
  }
  user {'alces':
    home=>'/var/lib/alces',
    ensure=>present,
    uid=>500,
    gid=>500,
    require=>Group['alces']
  }
  file {'/var/lib/alces/':
    ensure=>directory,
    owner=>'alces',
    group=>'alces',
    mode=>'0750',
    require=>User['alces'],
  }
  file {'/var/lib/alces/bin':
    ensure=>directory,
    owner=>'alces',
    group=>'alces'
  }
  file {'/var/lib/alces/share/':
    ensure=>directory,
    owner=>'alces',
    group=>'alces'
  }
}
