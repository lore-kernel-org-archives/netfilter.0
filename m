From: Silkk <crystaldrinker@yahoo.com>
Subject: If i follow these steps should i have prbs. with iptabls
Date: Thu, 12 Sep 2002 20:15:19 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913031519.10380.qmail@web40611.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hello,

I was wandering if someone could go  over this and
tell me if im did soomething wrong in these steps i
have tryed this many times but keep 

getting error wandering where im going wrong

Ok installed linux 7.2 it comes with iptables already
installed iptablesv1.2.3  Now i want to install
iptables 1.2.7 Soo here is what im 

doing...

Re-Compile my kernel to 2.4.19 with 
CONFIG_PACKET 
CONFIG_NETFILTER 
CONFIG_CONNTRACK 
CONFIG_IP_NF_FTP 
CONFIG_IP_NF_IRC 
CONFIG_IP_NF_IPTABLES 
CONFIG_IP_NF_FILTER 
CONFIG_IP_NF_NAT 
CONFIG_IP_NF_MATCH_STATE 
CONFIG_IP_NF_TARGET_LOG 
CONFIG_IP_NF_MATCH_LIMIT 
CONFIG_IP_NF_TARGET_MASQUERADE 
ALL built in the kernel: 
***************************************************************************************************************************************
Next i am going to download IPTABLES-1.2.7 and install
them
bzip2 -cd iptables-1.2.3.tar.bz2 | tar -xvf 
make KERNEL_DIR=/usr/src/linux/ 
make install KERNEL_DIR=/usr/src/linux/ 
****************************************************************************************************************************************
Next im going to create a script for my iptables named
"rc.firewall" in the "/etc/rc.d/" dir. where i create
my rules:
then im going to 
chown root.root /etc/rc.d/rc.firewall
chmod u=rwx /etc/rc.d/rc.firewall
sh /etc/rc.d/rc.firewall
And im going to add the following line "sh
/etc/rc.d/rc.firewall" to the end of the
"/etc/ec.d/rc.local" file: all this is soo it will 

startup everytime compouters starts..
***************************************************************************************************************************************
Since i have a dynamic ip address im going to install
"PUMP" from Linux instal disc 2
rpm -iv pump-1.1.11

Then im going to create a "PUMP.CONF" file in the
"/etc" directpory which will look like this
-------------------------------------------------------------------
retries 3
script /etc/rc.d/rc.pump.done

device eth0 {
     noisdomain
}
------------------------------------------------------------
And then the following shell commands can be placed in
the firewall script some point after any HARDCODED
definitions of IPADDRESS
-------------------------------------------------------------
if [ -f /etc/rc.d/pump.info ]; then
     . /etc/rc.d/pump.info
 else

 echo "rc.firewall: dhcp is not configured."
 sh /ect/init.d/iptables panic
 exit 1 
fi
------------------------------------------------
Sooo then in the "/etc/rc.d" i will create this script
--------------------------------------------------------------------------
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

sh /etc/init.d/iptables restart

exit 0
-----------------------------------------------------------------------------------------

What im asking is if i follow these steps  should i
have any problems cause this is my 3 rd try with this
i wannaknow what i am doing wrong 

thanks for the help guys!!!


__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com

