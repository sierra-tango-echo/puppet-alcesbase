################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
export alces_PATH=/opt/alces
export alces_MODE=system

if [ -d "${alces_PATH}/etc/symphony/plugins.d" ]; then
  for a in "${alces_PATH}/etc/symphony/plugins.d"/*.sh; do
      if [ -r "$a" ]; then
	  source $a
      fi
  done
fi
