################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::sudo (
  
)
{
  file_line {'alces-to-sudoers':
      path => '/etc/sudoers',
      line => "alces           ALL=(ALL)      NOPASSWD: ALL",
  }
  package {'sudo':
    ensure=>installed
  }
}
