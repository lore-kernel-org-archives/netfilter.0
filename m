From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: NOT acceptable "/etc/sysconfig/network-scripts/ifup" script !!!
Date: Thu, 15 May 2003 00:19:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305150019.19803.pc-secure@home.nl>
References: <200305142155.31623.pc-secure@home.nl>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_nDsw++2qXI7M4zU"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305142155.31623.pc-secure@home.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--Boundary-00=_nDsw++2qXI7M4zU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Op woensdag 14 mei 2003 21:55, schreef P.Italiaander:
> hello all ,
>
> I have just installed the new Mandrake 9.1 as workstation , and i had to
> adjust the ifup script ,since i use internal, an dhcp-server.So it
> automaticaly adapt the /etc/hosts file.
> But to my  suprise , i saw that the ifup script , still is written for
> ipchains !!!! THIS IS NOT ACCEPTABLE
> So i will correct it the iptables-script , when it's done
> i'll send a copy , for other Mandrake or RedHat users , maybe come handy
>
> Pascal

I have made the update for the /etc/sysconfig/network-scripts/ifup script , 
this update is only usefull if you make use of a dhcp-client or server. ( 
local or ISP )  and of course iptables :)

I hope this is usefull for somebody,
   for me it did

Pascal


 

--Boundary-00=_nDsw++2qXI7M4zU
Content-Type: application/x-shellscript;
  name="ifup"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ifup"

#!/bin/bash
PATH=/sbin:/usr/sbin:/bin:/usr/bin
TEXTDOMAIN=initscripts

cd /etc/sysconfig/network-scripts
. ../network
. network-functions
. /etc/rc.d/init.d/functions

if [ "$DOMAINNAME" ]
then 
	if [ ! "$DOMAINNAME" == "`domainname`" ]
	then
		domainname "$DOMAINNAME"
	fi
fi

if [ "$NISDOMAIN" ]
then 
	if [ ! "$NISDOMAIN" == "`nisdomainname`" ]
	then
		nisdomainname "$NISDOMAIN"
	fi
fi

need_hostname

CONFIG=${1}

[ -z "${CONFIG}" ] && {
    echo $"usage: ifup <device name>" >&2
    exit 1
}

need_config ${CONFIG}

[ -f "${CONFIG}" ] || {
    echo $"$0: configuration for ${1} not found." >&2
    echo $"Usage: ifup <device name>" >&2
    exit 1
}

if [ ${UID} != 0 ]; then
    if [ -x /usr/sbin/usernetctl ]; then
	if /usr/sbin/usernetctl ${CONFIG} report ; then
	    exec /usr/sbin/usernetctl ${CONFIG} up
	fi
    fi
    echo $"Users cannot control this device." >&2
    exit 1
fi

source_config

if [ "foo$2" = "fooboot" -a "${ONBOOT}" = "no" -o "${ONBOOT}" = "NO" ]
then
    exit 0
fi
if [ -n "$IN_HOTPLUG" -a "${HOTPLUG}" = "no" -o "${HOTPLUG}" = "NO" ]
then
    exit 0
fi

DEVICETYPE=`echo ${DEVICE} | sed "s/[0-9]*$//"`
REALDEVICE=`echo ${DEVICE} | sed 's/:.*//g'`
if echo ${DEVICE} | grep -q ':' ; then
    ISALIAS=yes
else
    ISALIAS=no
fi

# Old BOOTP variable
if [ "${BOOTP}" = "yes" ]; then
    BOOTPROTO=bootp
fi

if [ "${BOOTPROTO}" = "bootp" -o "${BOOTPROTO}" = "dhcp" ]; then
    DYNCONFIG=true
    [ "${BOOTPROTO}" = bootp ] && DHCP_CLIENT=/sbin/pump
fi

if [ -x /sbin/ifup-pre-local ]; then
    /sbin/ifup-pre-local ${DEVICE}
fi

OTHERSCRIPT="/etc/sysconfig/network-scripts/ifup-${DEVICETYPE}"

if [ -x ${OTHERSCRIPT} ]; then
    exec ${OTHERSCRIPT} ${CONFIG} $2
fi

is_available ${REALDEVICE} || {
      if [ "$?" = "1" ] ; then
         echo $"$alias device does not seem to be present, delaying ${DEVICE} initialization."
         exit 1
      else
         exit 0
      fi
}
if [ -n "${HWADDR}" ]; then
    FOUNDMACADDR=`LC_ALL= LANG= ip -o link show ${REALDEVICE} | \
	sed 's/.*link\/ether \([[:alnum:]:]*\).*/\1/'`
    if [ "${FOUNDMACADDR}" != "${HWADDR}" ]; then
        NEWCONFIG=`fgrep -l "HWADDR=${FOUNDMACADDR}" /etc/sysconfig/network-scripts/ifcfg-*|head -1`
	rm -f /etc/sysconfig/networking/tmp/ifcfg-$DEVICE
	if [ -n "${NEWCONFIG}" ]; then
	    sed -e "s/^DEVICE=.*/DEVICE=$DEVICE/" < ${NEWCONFIG} > /etc/sysconfig/networking/tmp/ifcfg-$DEVICE
	   exec /sbin/ifup ${NEWCONFIG}
	fi
        NEWCONFIG=`fgrep -l "HWADDR=${FOUNDMACADDR}" /etc/sysconfig/networking/default/ifcfg-*|head -1`
	if [ -n "${NEWCONFIG}" ]; then
	    sed -e "s/^DEVICE=.*/DEVICE=$DEVICE/" < ${NEWCONFIG} > /etc/sysconfig/networking/tmp/ifcfg-$DEVICE
	   exec /sbin/ifup ${NEWCONFIG}
	else
	   echo $"Device ${DEVICE} has different MAC address than expected, ignoring."
	   exit 1
	fi
    fi
fi

# is the device wireless? If so, configure wireless device specifics
is_wireless_device ${DEVICE} && . ./ifup-wireless

if [ "${SLAVE}" = yes -a "${ISALIAS}" = no -a "${MASTER}" != "" -a \
     -x /sbin/ifenslave ]; then
    RFLAG="" ; [ "${RECEIVEONLY}" = yes ] && RFLAG="-r"

    ifconfig ${DEVICE} down
    echo $"Enslaving ${DEVICE} to ${MASTER}"
    ifenslave ${RFLAG} "${MASTER}" "${DEVICE}"

    exit 0
fi

# Now, run the specific script for Wireless LAN interfaces
# Note : we need the wireless parameters to be set up before IP parameters,
# so that we can perform DHCP over the Wireless link if needed. Jean II

if [ -n "${WIRELESS_MODE}${WIRELESS_ESSID}${WIRELESS_NWID}${WIRELESS_FREQ}${WIRELESS_SENS}${WIRELESS_RATE}${WIRELESS_ENC_KEY}${WIRELESS_RTS}${WIRELESS_FRAG}${WIRELESS_IWCONFIG}${WIRELESS_IWSPY}${WIRELESS_IWPRIV}${WIRELESS_ESSID}" -a -x /sbin/iwconfig ] ; then
    # Set all desired settings via iwconfig

    # Mode need to be first : some settings apply only in a specific mode !
    if [ "$WIRELESS_MODE" ] ; then
	/sbin/iwconfig $DEVICE mode $WIRELESS_MODE
    fi
    # This is a bit hackish, but should do the job right...
    if [ "$WIRELESS_ESSID" ] || [ "$WIRELESS_MODE" ] ; then
        NICKNAME=`/bin/hostname`
	/sbin/iwconfig $DEVICE nick $NICKNAME >/dev/null 2>&1
    fi
    # Regular stuff...
    if [ "$WIRELESS_NWID" ] ; then
	/sbin/iwconfig $DEVICE nwid $WIRELESS_NWID
    fi
    if [ "$WIRELESS_FREQ" ] ; then
	/sbin/iwconfig $DEVICE freq $WIRELESS_FREQ
    elif [ "$WIRELESS_CHANNEL" ] ; then
	/sbin/iwconfig $DEVICE channel $WIRELESS_CHANNEL
    fi
    if [ "$WIRELESS_SENS" ] ; then
	/sbin/iwconfig $DEVICE sens $SENS
    fi
    if [ "$WIRELESS_RATE" ] ; then
	/sbin/iwconfig $DEVICE rate $WIRELESS_RATE
    fi
    if [ "$WIRELESS_ENC_KEY" ] ; then
	/sbin/iwconfig $DEVICE key $WIRELESS_ENC_KEY
    fi
    if [ "$WIRELESS_RTS" ] ; then
	/sbin/iwconfig $DEVICE rts $WIRELESS_RTS
    fi
    if [ "$WIRELESS_FRAG" ] ; then
	/sbin/iwconfig $DEVICE frag $WIRELESS_FRAG
    fi
    # More specific parameters
    if [ "$WIRELESS_IWCONFIG" ] ; then
	/sbin/iwconfig $DEVICE $WIRELESS_IWCONFIG
    fi
    if [ "$WIRELESS_IWSPY" ] ; then
	/sbin/iwspy $DEVICE $WIRELESS_IWSPY
    fi
    if [ "$WIRELESS_IWPRIV" ] ; then
	/sbin/iwpriv $DEVICE $WIRELESS_IWPRIV
    fi
    # ESSID need to be last : most device re-perform the scanning/discovery
    # when this is set, and things like encryption keys are better be
    # defined if we want to discover the right set of APs/nodes.
    if [ "$WIRELESS_ESSID" ] ; then
	/sbin/iwconfig $DEVICE essid "$WIRELESS_ESSID"
    fi
fi

if [ -n "${MACADDR}" ]; then
   ifconfig ${DEVICE} hw ether ${MACADDR}
fi

if [ -n "$DYNCONFIG" -a "XXX$DHCP_CLIENT" = "XXX" ];then
    if [ -x /sbin/dhcpcd ];then
	DHCP_CLIENT=/sbin/dhcpcd
    elif [ -x /sbin/pump ];then
	DHCP_CLIENT=/sbin/pump
    elif [ -x /sbin/dhcpxd ];then
	DHCP_CLIENT=/sbin/dhcpxd
    elif [ -x /sbin/dhclient ];then
	DHCP_CLIENT=/sbin/dhclient
    else 
	echo $"Can't find a dhcp client"
	exit 1;
    fi
fi  

DHCP_ARGS=
if [ "XXX$DHCP_CLIENT" != "XXX" ];then
case $(basename $DHCP_CLIENT) in
    dhcpcd)
    [ -n "$DHCP_HOSTNAME" ] && DHCP_ARGS="-h $DHCP_HOSTNAME"
    [ -n "$NEEDHOSTNAME" ] && DHCP_ARGS="$DHCP_ARGS -H"
    [ "${PEERDNS}" = "no" ] && DHCP_ARGS="$DHCP_ARGS -R"
    [ "X${DOMAINNAME}" = "X" ] && DHCP_ARGS="$DHCP_ARGS -D"
    DHCP_ARGS="$DHCP_ARGS $DEVICE"
    ;;
    pump)
    [ -n "$DHCP_HOSTNAME" ] && DHCP_ARGS="-h $DHCP_HOSTNAME"
    [ -n "$NEEDHOSTNAME" ] && DHCP_ARGS="$DHCP_ARGS --lookup-hostname"
    [ "${PEERDNS}" = "no" ] && DHCP_ARGS="$DHCP_ARGS -d"
    DHCP_ARGS="$DHCP_ARGS -i $DEVICE"
    ;;
    dhcpxd)
    # Dhcpxd don't support NEED_HOSTNAME ? guess i need time to patch
    # this animal
    [ -n "$DHCP_HOSTNAME" ] && DHCP_ARGS="-H $HOSTNAME"
    DHCP_ARGS="$DHCP_ARGS $DEVICE"
    ;;
    dhclient)
    # Can't specify a host with dhclient ? same remark for
    # $NEEDHOSTNAME this client suck !!!
    DHCP_ARGS="$DEVICE"
    ;;
esac
fi

if [ -n "${MTU}" ]; then
   ip link set ${DEVICE} mtu ${MTU}
fi

# Is there a firewall running, and does it look like one we configured?
# Patched for compatability with iptables firewalls.
FWACTIVE=
if [ -f "`which iptables`" -a "`iptables -L INPUT -n 2>&1 | grep -c "Chain"`" == 1 ]; then  
	FWACTIVE=1
	export FWACTIVE
fi
			     
if [ -n "$DYNCONFIG" ]; then
    echo -n $"Determining IP information for ${DEVICE}..."

    # DHCP clients need DNS to be available, and we don't know
    # what DNS server they're using until they are done.
    FWHACK=
    if [ -n "$FWACTIVE" -a "$FIREWALL_MODS" != "no" ]; then
        iptables -I INPUT -p udp -s 0/0 --sport 53 -d 0/0 --dport 1025:65535 -j ACCEPT
	FWHACK=1
    fi

    if $DHCP_CLIENT $DHCP_ARGS ; then
	echo $" done."
    else
	echo $" failed."
	[ -n "$FWHACK" ] && iptables -D INPUT -p udp -s 0/0 --sport 53 -d 0/0 --dport \
		1025:65535 -j ACCEPT
	exit 1
    fi

    [ -n "$FWHACK" ] && iptables -D INPUT -p udp -s 0/0 --sport 53 -d 0/0 --dport \
    		1025:65535 -p udp -j ACCEPT
else 
    if [ -z "${IPADDR}" ]; then
         # enable device without IP, useful for e.g. PPPoE
	 ip link set ${DEVICE} up
	 if [ "${NETWORKING_IPV6}" = "yes" ]; then
	    /etc/sysconfig/network-scripts/ifup-ipv6 ${CONFIG}
	 fi
	 exec /etc/sysconfig/network-scripts/ifup-post ${CONFIG} ${2}
    fi
  
    expand_config
    
    [ -n "${ARP}${PROMISC}${ALLMULTI}" ] && \
	ip link set ${DEVICE} $(toggle_value arp $ARP) \
	   $(toggle_value promisc $PROMISC) \
	   $(toggle_value allmulti $ALLMULTI)
   
    if ! ip link set ${DEVICE} up ; then
	echo $"Failed to bring up ${DEVICE}."
	exit 1
    fi

    if ! arping -q -c 2 -w 3 -D -I ${DEVICE} ${IPADDR} ; then
	echo $"Error, some other host already uses address ${IPADDR}."
	exit 1
    fi

    if [ "${DEVICE}" = "lo" ]; then
    	SCOPE="scope host"
    else
        SCOPE=
    fi

    if ! LC_ALL=C ip addr ls ${DEVICE} | grep -q "${IPADDR}/${PREFIX}" ; then
	if ! ip addr add ${IPADDR}/${PREFIX} \
	    brd ${BROADCAST:-+} dev ${DEVICE} ${SCOPE} ; then
	    echo $"Error adding address ${IPADDR} for ${DEVICE}."
	fi
    fi

    # update ARP cache of neighboring computers
    arping -q -A -c 1 -I ${DEVICE} ${IPADDR}
    ( sleep 2;
      arping -q -U -c 1 -I ${DEVICE} ${IPADDR} ) > /dev/null 2>&1 < /dev/null &

    # Add a route for the subnet.  Replace any existing route.
    if [ "${ISALIAS}" = no ]; then
	ip route replace ${NETWORK}/${PREFIX} dev ${DEVICE}
    fi

    # Set a default route.
    if [ -z "${GATEWAYDEV}" -o "${GATEWAYDEV}" = "${DEVICE}" ]; then
	# set up default gateway
	if [ -n "${GATEWAY}" -a "`ipcalc --network ${GATEWAY} ${NETMASK} 2>/dev/null`" = "NETWORK=${NETWORK}" ]; then
	    ip route add default via ${GATEWAY}
	    DEFGW=${GATEWAY}
	elif [ "${GATEWAYDEV}" = "${DEVICE}" ]; then
	    ip route add default dev ${DEVICE}
	fi
    fi
fi

. /etc/sysconfig/network

# IPv6 initialisation?
if [ "${NETWORKING_IPV6}" = "yes" ]; then
    /etc/sysconfig/network-scripts/ifup-ipv6 ${CONFIG}
fi

if [ "${IPX}" = yes ]; then
       /etc/sysconfig/network-scripts/ifup-ipx ${DEVICE}
fi

exec /etc/sysconfig/network-scripts/ifup-post ${CONFIG} ${2}

--Boundary-00=_nDsw++2qXI7M4zU--


