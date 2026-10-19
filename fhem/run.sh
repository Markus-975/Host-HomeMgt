#!/bin/sh
#
cd /opt/docker/fhem
cp ./mycustom/99_Abfalltermine.pm ./config/FHEM/
cp ./mycustom/99_attrT_WLED_Utils.pm ./config/FHEM/
cp ./mycustom/99_attrT_z2m_thermostat_Utils.pm ./config/FHEM/

### UDEV Rules for Enocean + Zigbee 
cp ./mycustom/10-fhem.rules /etc/udev/rules.d/


### User Creation
adduser fhem --uid 1011  --no-create-home

# Füge FHEM zu Gruppe dialout hinzu
usermod -aG dialout fhem
