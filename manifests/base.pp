################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::base (
  $nvidia=false,
  $jitter=$alcesbase::jitter,
  $serialconsoledevice=undef,
  $serialconsolebaud=undef,
)
{

  file {'/etc/modprobe.d/alces-blacklist.conf':
    ensure=>present,
    owner=>'root',
    group=>'root',
    content=>template('alcesbase/alces-blacklist.conf.erb')
  }

  #IPMI service
  if $jitter {
    if ! str2bool($is_virtual) {
      package { "OpenIPMI":
        ensure=>'installed'
      }
      service { 'ipmi':
        enable=>true,
        ensure=>running
      }
    }
  }

  #PDSH
  file {'/etc/genders':
      mode=>0644,
      owner=>'root',
      group=>'root',
      ensure=>present,
      content=>template('alcesbase/genders.erb')
  }

  #Serial console
  if ($serialconsoledevice) and ($serialconsolebaud) {
    $serialconsole_device=$serialconsoledevice
    $serialconsole_baud=$serialconsolebaud
    file {'/etc/init/alces_serial.conf':
      ensure=>present,
      mode=>0644,
      owner=>'root',
      group=>'root',
      content=>template('alcesservices/alces_serial.erb')
    }
  } 
}
