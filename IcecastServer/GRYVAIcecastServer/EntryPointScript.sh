#!/bin/sh


if [ -n "$icecast_source_password" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$icecast_source_password<\/source-password>/g" /etc/icecast.xml
fi
if [ -n "$icecast_relay_password" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$icecast_relay_password<\/relay-password>/g" /etc/icecast.xml
fi
if [ -n "$icecast_admin_email" ]; then
    sed -i "s/<admin>[^<]*<\/admin>/<admin>$icecast_admin_email<\/admin>/g" /etc/icecast.xml
fi
if [ -n "$icecast_admin_username" ]; then
    sed -i "s/<admin-user>[^<]*<\/admin-user>/<admin-user>$icecast_admin_username<\/admin-user>/g" /etc/icecast.xml
fi
if [ -n "$icecast_admin_password" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$icecast_admin_password<\/admin-password>/g" /etc/icecast.xml
fi
if [ -n "$icecast_location" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$icecast_location<\/location>/g" /etc/icecast.xml
fi
if [ -n "$icecast_hostname" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$icecast_hostname<\/hostname>/g" /etc/icecast.xml
fi
if [ -n "$icecast_max_clients" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$icecast_max_clients<\/clients>/g" /etc/icecast.xml
fi
if [ -n "$icecast_max_sources" ]; then
    sed -i "s/<sources>[^<]*<\/sources>/<sources>$icecast_max_sources<\/sources>/g" /etc/icecast.xml
fi


echo "Icecast configuration:"
cat /etc/icecast.xml
echo "Start Icecast"
#sleep 720000

icecast -c /etc/icecast.xml
echo "Finished Icecast"