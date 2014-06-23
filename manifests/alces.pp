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

  if $alcesbase::role == 'master' {
    file {'/etc/init.d/alces-prime':
      ensure=>present,
      mode=>0744,
      owner=>'root',
      group=>'root',
      content=>template('alcesbase/alces/el6/alces-prime.erb')
    }
    service {'alces-prime':
      ensure=>'running',
      enable=>true,
      require=>[File['/etc/init.d/alces-prime'],File['/opt/alces/tools/alces-prime/config/prime/'],File['/opt/alces/tools/alces-prime/log']],
    }
    file {['/var/www','/var/www/html','/var/www/html/stylesheets']:
          mode=>755,
          owner=>'root',
          group=>'root',
          ensure=>directory,
          require=>Package['httpd'],
    }
    file {'/etc/httpd/conf.d/alces-prime.conf':
         mode=>0644,
         owner=>'apache',
         group=>'apache',
         content=>template("alcesbase/alces/alces-prime.http.conf.erb"),
         require=>Package['httpd'],
         notify=>Service['httpd']
         }
     file {['/opt/alces/tools','/opt/alces/tools/alces-prime','/opt/alces/tools/alces-prime/config','/opt/alces/tools/alces-prime/config/prime/']:
         mode=>0755,
         owner=>'root',
         group=>'root',
         ensure=>directory,
     }
     file {'/var/www/html/index.html':
         ensure=>present,
         mode=>0644,
         group=>'root',
         owner=>'root',
         content=>template('alcesbase/alces/alces-prime-index.html.erb')
     }
     file {'/var/www/html/stylesheets/cirrus.css':
         ensure=>present,
         mode=>0644,
         group=>'root',
         owner=>'root',
         source=>'puppet:///modules/alcesbase/alces/cirrus.css' 
      }
      file {'/var/www/html/alces.png':
         ensure=>present,
         mode=>0644,
         group=>'root',
         owner=>'root',
         source=>'puppet:///modules/alcesbase/alces/alces.png'
      }
      file {'/opt/alces/tools/alces-prime/config/prime/machines.yml':
         ensure=>present,
         owner=>'root',
         group=>'root',
         mode=>644,
         content=>template("alcesbase/alces/alces-prime.machines.erb"),
         require=>File['/opt/alces/tools/alces-prime/config/prime/'],
         notify=>Service['alces-prime']
      }
      file {'/opt/alces/tools/alces-prime/config/prime/packages.yml':
         ensure=>present,
         owner=>'root',
         group=>'root',
         mode=>644,
         content=>template("alcesbase/alces/alces-prime.packages.erb"),
         require=>File['/opt/alces/tools/alces-prime/config/prime/'],
         notify=>Service['alces-prime']
      }
      file {'/opt/alces/tools/alces-prime/log':
         ensure=>link,
         target=>'/var/log/alces/alces-prime'
      }
      file {'/var/log/alces/alces-prime':
         ensure=>directory,
         mode=>700,
         group=>'alces-www',
         owner=>'alces-www',
         require=>User['alces-www']
      }
      file {'/etc/logrotate.d/alces-prime':
         ensure=>present,
         mode=>0644,
         owner=>'root',
         group=>'root',
         content=>template('alcesbase/alces/alces-prime-logrotate.erb')
      }
      group {'alces-www':
         ensure=>present,
         gid=>352
      }

      user {'alces-www':
           home=>'/opt/alces/tools',
           shell=>'/sbin/nologin',
           comment=>'Alces Web services',
           ensure=>present,
           uid=>352,
           gid=>352,
           require=>Group['alces-www']
      }
      
    }
}
