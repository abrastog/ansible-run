script


Check application



#!/bin/bash
#
# check if the app is running or not.

# delete old status file

If [ -f /ans/appstatus  ]  ; then
    Rm /ans/appstatus
fi


#check the latest status for app servers

For server in appserver    ;do
  If curl -s —head  http://$server | grep “200 OK”  > /dev/null;
then
     Echo “$server application up ” >> /ans/appstatus
   Else
     Echo “$server  application down  ”  >> /ans/appestats
 Fi
Done
