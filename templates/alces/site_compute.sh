#!/bin/bash -x
########################################
# ALCES STACK SITE CUSTOMISATION SCRIPT#
########################################
# Use this file to script any changes you'd like to make to any freshly installed machines. 
# The install procedure is as follows:
# Stage 0: Anaconda boot, kickstart installation init script installation and reboot
# Stage 1: Puppet / Overlay installation and reboot
# Stage 2: This script executes at end of boot sequenece
# 
# REMEMBER TO MAKE YOUR SCRIPT UNATTENDED SO AS NOT TO LOCKUP THE BOOT PROCESS
# LOGS CAN BE FOUND IN:
# /var/log/alces/alces-site-specific.log
########### ENTER YOUR OWN CONFIGURATION HERE ###############

#############################################################
