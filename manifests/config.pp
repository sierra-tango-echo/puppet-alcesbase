################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2014 Alces Software Ltd
##
################################################################################
class alcesbase::config (
  $vgl=$alcesbase::vgl
)
{
  #Configure Alces Tools
  class { 'alcesbase::alces':
  }

  class { 'alcesbase::sudo':
  }

  class { 'alcesbase::motd':
  }

  class { 'alcesbase::x':
    vgl=>$vgl,
  }

  class { 'alcesbase::userprofile':
  }

  class { 'alcesbase::envmodules':
  }
}
