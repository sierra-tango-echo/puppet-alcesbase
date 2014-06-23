################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesbase::x (
  $x=true,
  $vgl
)
{
  if $x {
    package { ["control-center", "dbus", "gdm", "gdm-user-switch-applet", "gnome-panel", "gnome-screensaver", "gnome-session", "gnome-terminal", "metacity", "nautilus", "notification-daemon", "polkit-gnome"]:
      ensure=>installed,
    }
    #exec { 'yum Group Install':
    #  unless  => '/usr/bin/yum grouplist "Desktop" | /bin/grep "^Installed Groups"',
    #  command => '/usr/bin/yum -y groupinstall "Desktop"',
    #}
    package {'xorg-x11-xdm':
            ensure=>installed,
            }
    package {'tigervnc-server':
	    ensure=>installed,
	    }

    if $vgl {
      package {'VirtualGL':
        ensure=>installed,
      }
      file_line {"initlevel":
        path=>'/etc/inittab',
        ensure=>present,
        line=>inline_template("id:5:initdefault:"),
        match=>"^id:",
      }
      file {"/etc/sysconfig/desktop":
        ensure=>present,
        content=>template('alcesbase/sysconfig-desktop.erb'),
        owner=>'root',
        group=>'root',
        mode=>'0644'
      }
      file_line {"xhost_local":
        path=>"/etc/X11/xdm/Xsetup_0",
        ensure=>present,
        line=>"xhost +LOCAL:",
        require=>Package['xorg-x11-xdm'],
      }
      file {"/etc/X11/xorg.conf":
        ensure=>present,
        content=>template('alcesbase/xorg.conf.erb'),
        owner=>'root',
        group=>'root',
        mode=>'0644'
      }
    }
  }
}
