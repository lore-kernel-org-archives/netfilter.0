From: Tasha Smith <natasha3641@yahoo.com>
Subject: Ineeed of major help with  Dynamic IP Addy for my IPTABLES :(((
Date: Wed, 16 Oct 2002 21:18:44 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017041844.56340.qmail@web40707.mail.yahoo.com>
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

Hiii,
Guys!
What iam running:
Linux 7.2 Kernel 2.4.19
Iptables-1.2.7a
Pump-0.8.11-7

K, Since i am connected to the net with a ADSL connection my ip address changes
usually. But in my script i have to put in my  ipaddy in some rules. My iptables
script is in my "/etc/init.d" named "firewall" and it runs and is working.But to
update my iptables in the script i installed "PUMP" .(i tryed following the
directions out of LINUX FIREWALLS book ed.2) I created a pump.conf file in /etc
dir whick looks like this!
# "/etc/pump.conf"

retries 3
script /etc/rc.d/rc.pump.done

device eth0 {
     noisdomain
}
*******************************************************************************
And in the "/etc/rc.d/" i created this script like the book said and ran it
using "chmod -u=rwx /etc/rc.d/rc.pump.done" here is what the script looks like:

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
********************************************************************************
And soo after any where in the script where my IP ADDRESS is i put this
 
if [ -f /etc/rc.d/pump.info ]; then
     . /etc/rc.d/pump.info
 else

 echo "rc.firewall: dhcp is not configured."
 sh /ect/init.d/iptables panic
 exit 1 
fi
********************************************************************************
But it is not working:  here is what i get  when i reboot all that happen when
linux says: 

Starting up redhat network daemon:  
/etc/init.d/ipatables no such file or directory  <---- i didnt catch the whole
error cause it disappers to fast and cant find it in /var/log/boot.log but  i
know it is pretty close to the error!!  ANY HELP GUYS :((((( 

__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com

