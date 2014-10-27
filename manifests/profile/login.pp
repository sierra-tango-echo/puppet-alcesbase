################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::profile::login (
  $role,
) inherits ::alcesbase::profile
{
  $profile='login'
  class { 'alcesbase':
          role=>$role,
          profile=>$profile,
          stage=>init,
        }
  class { 'alcesbase::install':
          stage=>install,
        }
  class { 'alcesbase::config':
          stage=>configure,
  }
  class { 'alcesservices':
           role=>$role,
           profile=>$profile,
           machine=>$alces_machine,
           stage=>configure,
  }
  class { 'alceshpc':
          role=>$role,
          profile=>$profile,
          machine=>$alces_machine,
          stage=>configure,
  }
}
