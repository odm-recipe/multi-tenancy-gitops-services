#!/bin/bash
oc project tools
ldap_pod=$(oc get pods -l role=ldap -o name)
oc rsh ${ldap_pod} /bin/bash 
/opt/ibm/ldap_scripts/addLdapUser.py -u icnadm -p Passw0rd -r user
/opt/ibm/ldap_scripts/addLdapUser.py -u odmadm -p Passw0rd -r user

echo done!