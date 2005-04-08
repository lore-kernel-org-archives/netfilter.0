From: "Ryan Belcher" <Ryanb@sealevel.com>
Subject: Strange connection problems.
Date: Fri, 8 Apr 2005 17:14:09 -0400
Message-ID: <B39AA5DB06510C4591C6EDDD580B0B81B5315D@mail.int.sealevel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

Below I've posted my FW config.  It's handling 3 interfaces.  ppp0, =
eth0, an ath0.
It's on Linux kernel version 2.6.10.

Pretty much everything works as I expect except for a strange issue with =
certain websites while trying to connect from clients within my network. =
 For example, penny-arcade.com, americanexpress.com SSL logins, and a =
few others.  If you want to poke at this configuration, penny-arcade =
will appear to begin connection but after the SYN, ACK, then HTTP GET =
sequence, the HTTP response never gets here (according to Ethereal =
anyways).  If I try connecting from the actual firewalling box itself, =
it works fine.

Does anyone have any ideas?

Thanks,

Ryan
-----------------Snip----------------
IPTABLES=3D/usr/sbin/iptables
DEPMOD=3D/sbin/depmod
MODPROBE=3D/sbin/modprobe
IFCONFIG=3D/sbin/ifconfig
AWK=3D/usr/bin/awk
GETIP=3D/usr/bin/gethostip
PENGUIN=3D192.168.0.4
BRENT=3D192.168.0.12
MERCURY=3D192.168.0.3
EXTIF=3D"ppp0"
INTIF=3D"eth0"
WIRLS=3D"ath0"
echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"
echo "   Wirleless Interface:  $WIRLS"
echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

# Start doing something...
echo "   Clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F
$IPTABLES -t filter -F
$IPTABLES -t mangle -F

echo "   FWD: Allow all connections OUT and only existing and related =
ones IN"
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $WIRLS -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $WIRLS -j ACCEPT
$IPTABLES -A FORWARD -i $WIRLS -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state =
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $WIRLS -m state --state =
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -j LOG

echo "  INPUT: Allow local connections in.  Nothing from the outside =
though."
$IPTABLES -A INPUT -i $EXTIF -m state --state ESTABLISHED,RELATED -j =
ACCEPT
$IPTABLES -A INPUT -i $INTIF -j ACCEPT
$IPTABLES -A INPUT -i $WIRLS -j ACCEPT

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

EXTIP=3D"`$IFCONFIG $EXTIF | $AWK =
/$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"

#Enable Port forward...Webserver
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 80 -m state \
 --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 80 -j DNAT --to =
$PENGUIN:80

#Brent
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 4747 -m state \
 --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 4747 -j DNAT =
--to $BRENT:4747

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 6112 -m state \
 --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 6112 -j DNAT =
--to $BRENT:6112

#Common Services to penguin
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 20:25 -m state \
 --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 20:25 -j DNAT =
--to $PENGUIN

#BITORRENT
$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 6880:6899 -j ACCEPT




echo -e "\nrc.firewall-2.4 v$FWVER done.\n"
-----------------/Snip---------------



