################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::profile::compute (
  $role,
) inherits ::alcesbase::profile
{
  $profile='compute'
  class { 'alcesbase':
          role=>$role,
          profile=>$profile,
          stage=>init,
	  jitter=>false,
        }
  class { 'alcesbase::install':
          stage=>install,
        }
  class { 'alcesnetwork':
          role=>$role,
          profile=>$profile,
          stage=>install,
          destructive=>$reinstall,
  }
  class { 'alcesbase::config':
          stage=>configure,
  }
  class { 'alcesservices':
           role=>$role,
           profile=>$profile,
           machine=>$alces_machine,
           stage=>configure,
	   jitter=>false,
  }
  class { 'alcesmonitoring':
                role=>$role,
                profile=>$profile,
                machine=>$alces_machine,
                stage=>configure,
  }
}
