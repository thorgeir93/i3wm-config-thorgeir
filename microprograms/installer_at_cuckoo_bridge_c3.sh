#!/bin/bash
# Usage: bash installer_at_cuckoo_ber1.sh
#
# ssh to a cuckoo server and be root
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

get_user_permission "ASH1 login (cuckoo bridge)"
installer_bridge_ssh "10.117.54.201"
installer_ssh_login

get_user_permission "work session setup"
bridge_setup_work_session

#xdotool key Escape
##xdotool key i s s h space i n s t a l l e r at 1 0 period 1 0 5 period 5 4 period 5 1 Escape
## 10.3.91.16
## c3cuckoobridge01.amadis.com
#xdotool key i s s h space i n s t a l l e r at c 3 c u c k o o b r i d g e 0 1 period a m a d i s period c o m Escape
#xdotool key Escape p
#xdotool key Return
#sleep 1.5
#
#xdotool key q w e r t y 7 7
#xdotool key Return
#sleep 1
#
#xdotool key s u d o space minus i
#xdotool key Return
#sleep 0.5
#xdotool key q w e r t y 7 7
#xdotool key Return
#sleep 0.5
#
#xdotool key s e t space minus o space v i
#xdotool key Return
#
#xdotool key c l e a r
#xdotool key Return
#
#xdotool key alt+a colon s e t w space
#xdotool key s y n c h r o n i z e minus p a n e s space o f f
#xdotool key Return
#
#xdotool key s u d o space s u space minus space c u c k o o 
#xdotool key Return
#
#xdotool key s o u r c e space asciitilde slash v e n v slash b i n slash a c t i v a t e
#xdotool key Return
#
## Goto cuckoo_setup repo.
#xdotool key alt+a o
##xdotool key Return
#
#xdotool key c d space slash v a r slash d a t a slash g i t l a b slash s a n d b o x underscore t o o l s slash s a n d b o x underscore c r o n underscore j o b s
#
#xdotool key Return
#
## Tail cuckoo log
#xdotool key alt+a o
#xdotool key t a i l space minus f space minus n space 1 0 0 space 
#xdotool key slash h o m e slash c u c k o o slash period c u c k o o slash l o g slash d i s t r i b u t e d period l o g
#
#xdotool key Return
#
## Tail cuckoo log
#xdotool key alt+a o
