From: Tasha Smith <natasha3641@yahoo.com>
Subject: Re: Ineeed of major help with  Dynamic IP Addy for my IPTABLES :(((
Date: Wed, 16 Oct 2002 21:48:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017044848.63963.qmail@web40701.mail.yahoo.com>
References: <20021017041844.56340.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021017041844.56340.qmail@web40707.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ohh just soo you guys know "was i suppose to do this part to the rc.pump.done
script": 
"chmod -u=rwx /etc/rc.d/rc.pump.done" or should i have left that part out?????

And 1 more thing when i changed in the script
"sh /etc/init.d/iptables panic "to ----->" /etc/init.d/firewall panic


#!/bin/bash

if [ "$1" = "down" ]; then
    exit 0
fi

if [ "$1" = "lease" ]; then
    echo address $3 assigned to network interface $2 >
/dev/console
fi

/sbin/pump -i eth0 -s > /var/tmp/pump.out

IPADDR=`fgrep IP: /var/tmp/pump.out | sed -e "s/.*IP:
//"`
NETMASK=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*Netmask: //"`
BROADCAST=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*Broadcast: //"`
NETWORK=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*Network: //"`
DHCP_SERVER=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*DHCP_SERVER: //"`
GATEWAY=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*Gateway: //"`
DOMAIN=`fgrep IP: /var/tmp/pump.out | sed -e
"s/.*Domain: //"`

rm /var/tmp/pump.out

echo IPADDR=$IPADDR . /etc/rc.d/pump.info
echo NETMASK=$NETMASK >> /etc/rc.d/pump.info
echo SUBNET_BASE=$NETWORK >> /etc/rc.d/pump.info
echo SUBNET_BROADCAST=$BROADCAST >>
/etc/rc.d/pump.info
echo GATEWAY=$GATEWAY >> /etc/rc.d/pump.info
echo HOSTNAME=$HOSTNAME >> /etc/rc.d/pump.info
echo DHCP_SERVER=$DHCP_SERVER>> /etc/rc.d/pump.info

sh /etc/init.d/iptables restart  <---when i changed iptables to firewall retsart

exit 0
********************************************************************************
AND HERE WHEN I CHANGE IPTABLES TO FIREWALL sh/etc/init.d/firewall panic 

if [ -f /etc/rc.d/pump.info ]; then
     . /etc/rc.d/pump.info
 else

 echo "rc.firewall: dhcp is not configured."
 sh /etc/init.d/iptables panic <---when i changed this to firewall panic
 exit 1 
fi
********************************************************************************
WHEN I CHANGES THOSE 2 THINGS IPTABLES TO FIREWALL AND RESTART MY MACHINE ALL IT
WILL DO WHEN IT starts it SAYS 
STARTING UP REDHAT NETWORK DAEMON
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
DHCP IS NOT CONFIGURED
"AND KEEPS SAYING THIS!"

Just thought i would let you know i tryed that!!!! And thats what happen  


__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com

