From: Aaron Steimle <asteimle@washpat.com>
Subject: port fowarding problems
Date: Thu, 12 Feb 2004 19:30:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402C1AB4.8000809@washpat.com>
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

I have read through some of the list and have tried a lot of stuff from 
list, but I am still having problems.

I want to ssh from public ip to private ip.
Everything works internally just can't access anything from outside.

below is rules set and output after ruleset is run.

any help would be great.


++++++++++++++++++++++++++++++++++++++++++=
IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe

EXTIF="eth0"
INTIF="eth1"
echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"

echo -en "   loading modules: "

# Need to verify that all modules have all required dependencies
#
echo "  - Verifying that all kernel modules are ok"
$DEPMOD -a

echo 
"----------------------------------------------------------------------"

#Load the main body of the IPTABLES module - "iptable"
#  - Loaded automatically when the "iptables" command is invoked
#
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "ip_tables, "
$MODPROBE ip_tables

echo -en "ip_conntrack, "
$MODPROBE ip_conntrack

echo -en "ip_conntrack_ftp, "
$MODPROBE ip_conntrack_ftp

echo -en "ip_conntrack_irc, "
$MODPROBE ip_conntrack_irc

echo -en "iptable_nat, "
$MODPROBE iptable_nat

echo -en "ip_nat_ftp, "
$MODPROBE ip_nat_ftp

echo -e "   Done loading modules.\n"

echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "   Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   Clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

PORTFWIP="192.168.1.101"
EXTIP="work IP"

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 22 -m state 
--state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 22
  -j DNAT --to $PORTFWIP:22






echo "   FWD: Allow all connections OUT and only existing and related 
ones IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE



echo -e "\nDone.\n"

+++++++++++++++++++++++++++++++++++++++

    External Interface:  eth0
    Internal Interface:  eth1
    loading modules:   - Verifying that all kernel modules are ok
----------------------------------------------------------------------
ip_tables, ip_conntrack, ip_conntrack_ftp, ip_conntrack_irc, 
iptable_nat, ip_nat_ftp, 
----------------------------------------------------------------------
    Done loading modules.

    Enabling forwarding..
    Enabling DynamicAddr..
    Clearing any existing rules and setting default policy..
    FWD: Allow all connections OUT and only existing and related ones IN
    Enabling SNAT (MASQUERADE) functionality on eth0

Done.




