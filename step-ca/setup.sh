#!bin/sh
#

# test acme provisioner
#
##docker exec -it step-ca step ca provisioner list

# creae ACME Provisioner
docker exec -it step-ca step ca provisioner add acme --type ACME


# test acme provisioner
#
docker exec -it step-ca step ca provisioner list

