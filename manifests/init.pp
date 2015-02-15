################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2014 Alces Software Ltd
##
################################################################################
class alcesbase (
  #Generic Alces variables
  #Supported profiles:
  # - generic
  $profile = hiera('alcesbase::profile','generic'),
  #Supported roles:
  # - slave
  # - master
  $role = hiera('alcesbase::role','slave'),
  #Supported machines
  # - generic
  $machine = hiera('alcesbase::machine',$alces_machine),
  #Cluster name:
  $clustername = hiera('alcesbase::clustername','alcescluster'),
  #HA (ha enabled?)
  $ha = hiera('alcesbase::ha',false),
  #Keep os jitter minimal
  $jitter=hiera('alcesbase::jitter',true),

)
{
  #For configure
  $vgl=hiera('alcesbase::vgl',false)

  validate_re($role, [ 'master', 'slave' ])
  if empty($machine) { fail 'no machine set' }

  #secondary variables
  if empty($clustername) { fail "empty parameter" }

  #Base setup
  class { 'alcesbase::base':
    nvidia=>hiera('alcesbase::nvidia',false),
  }

  class { 'alcesbase::services':
  }

  #Configure Alces Home
  class { 'alcesbase::home':
  }

  class { 'alcesbase::gpu':
    nvidia=>hiera('alcesbase::nvidia',false),
  }

}
