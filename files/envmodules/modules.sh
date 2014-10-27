shell=`/bin/basename \`/bin/ps -p $$ -ocomm=\``
if [ -f /usr/share/Modules/init/$shell ]
then
  . /usr/share/Modules/init/$shell
else
  . /usr/share/Modules/init/sh
fi

#Set a default MANPATH
export MANPATH=/usr/share/man:/usr/man:/usr/local/man:/usr/local/share/man:/usr/X11R6/man:$MANPATH

#export PATH
export PATH

#Source modules file from home dir
if [ -f ~/.modules ]; then
  source ~/.modules
fi

export MODULEPATH=$MODULEPATH:/opt/service/etc/modules:/opt/apps/etc/modules/
