From: Dhirendra Pal Singh <list@actiswitch.com>
Subject: How to do port forwarding dynamically
Date: Fri, 21 Feb 2003 16:59:32 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E56CB74.4090305@actiswitch.com>
References: <023001c2daaf$cd19fe80$020010ac@romio>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>

Hi All,
I am trying to set up a web server inside my home lan. Firewall is 
running on the gatewaty.
Below is the script for the firewall... (its very simple.. I downloaded 
it from the net)

*****************************************
#!/bin/sh
#
# rc.firewall-2.4
FWVER=0.70

echo -e "\n\nLoading simple rc.firewall version $FWVER..\n"
echo -e "\n\nLoading simple rc.firewall version $FWVER..\n"


IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod

EXTIF="eth0"
INTIF1="eth1"
INTIF2="eth2"
echo "   External Interface:  $EXTIF"
echo "   Internal Interface1:  $INTIF1"
echo "   Internal Interface2:  $INTIF2"

echo -en "   loading modules: "
echo "  - Verifying that all kernel modules are ok"
$DEPMOD -a
echo 
"----------------------------------------------------------------------"

echo -en "ip_tables, "
$INSMOD ip_tables

echo -en "ip_conntrack, "
$INSMOD ip_conntrack

echo -en "ip_conntrack_ftp, "
$INSMOD ip_conntrack_ftp

echo -en "ip_conntrack_irc, "
$INSMOD ip_conntrack_irc

echo -en "iptable_nat, "
$INSMOD iptable_nat

echo -en "ip_nat_ftp, "
$INSMOD ip_nat_ftp

echo ".  Done loading modules."

echo "   enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

echo "   FWD: Allow all connections OUT and only existing and related 
ones IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

echo -e "\nrc.firewall-2.4 v$FWVER done.\n"

**********************************************************************************************
I have stripped off the comments for simplicity. Now when I want to open 
a port and forward it I am trying to execute the following 2 commands...

$iptables -A INPUT -j ACCEPT -p tcp --syn --destination-port 5000
$iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 5000 -j DNAT 
--to-destination 192.168.1.30:80

Shouldnt this forward port 5000 to the internal box on port 80. But this 
is not working. Can someone please help me to correct this script.
Actually I want just 2 lines which I can run for any port and can open 
and forward it to anymachine of my choice...

Any quick help would be very much appreciated...
Thanks and advance..
Dp



