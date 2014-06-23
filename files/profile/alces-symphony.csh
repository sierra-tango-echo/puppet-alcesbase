################################################################################
##
## Alces HPC Software Stack - Symphony shell configuration
## Copyright (c) 2008-2014 Alces Software Ltd
##
################################################################################
setenv alces_PATH /opt/alces
setenv alces_MODE system

if ( -d "${alces_PATH}/etc/symphony/plugins.d" ) then
    set nonomatch
    foreach i ( "${alces_PATH}/etc/symphony/plugins.d"/*.csh )
	if ( -r "$i" ) then
	    source "$i"
	endif
    end
    unset i nonomatch
endif
