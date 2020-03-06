#!/bin/bash

export OS_DIR_CONFIG="/"
export OS_DIR_DATA="/data/mysterium/var/lib/mysterium-node"
export OS_DIR_RUN="/data/mysterium/var/run/mysterium-node"

mkdir -p $OS_DIR_DATA
mkdir -p $OS_DIR_RUN

echo "Starting nginx"
nginx -c /etc/nginx/nginx.conf 

sleep 2
netstat -ln

while true
do
    if [[ -f /data/mysterium/AGREE ]]; then
        echo "Config file found ..."
        
        export VPN_PORT=1294
        echo "Starting myst on port $VPN_PORT"
        
        #--config-dir=$OS_DIR_CONFIG \
    
        # export MYST="
        # /usr/bin/myst service \
        # --vendor.id="AVADO" \
        # --data-dir=$OS_DIR_DATA \
        # --runtime-dir=$OS_DIR_RUN \
        # --tequilapi.address=0.0.0.0 \
        # --ui.enable \
        # service 
        # --openvpn.port $VPN_PORT
        # "

        # echo "starting : $MYST"

        # /usr/bin/myst service --vendor.id="AVADO" --data-dir=$OS_DIR_DATA --runtime-dir=$OS_DIR_RUN --tequilapi.address=0.0.0.0 --ui.enable service  --openvpn.port $VPN_PORT
        /usr/bin/myst --vendor.id="AVADO" --ui.enable --tequilapi.address=0.0.0.0 --data-dir=$OS_DIR_DATA service --openvpn.port $VPN_PORT --agreed-terms-and-conditions openvpn
        
        echo "myst exited... wait 5m"
        sleep 600

      else
        if [[ -z "${WAITING_MESSAGE_SHOWN}" ]]; then
            echo "Config files not present yet... waiting"
        fi
        export WAITING_MESSAGE_SHOWN=1
        sleep 2
    fi
done
