From: Juan Hernandez <alucard@kanux.com>
Subject: netfilter stops working
Date: 22 Jan 2004 12:14:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
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
Content-Type: text/plain; charset="us-ascii"
To: Lista de netfilter <netfilter@lists.netfilter.org>

Hi there...


   I'm running a firewall-router machine in a Red Hat Linux 9 box. I
have uploaded Red hat's latest kernel 2.4.20-28 I guess. My problem is
this... This box has been working perfectly for the last 6 months and it
even had a 6 months uptime with no reboots. Suddendly, the box quit
working and I started getting this message when I log the packets...

-----
IN=eth0 OUT=eth0 SRC=192.168.0.14 DST=200.44.32.13 LEN=62 TOS=0x00
PREC=0x00 TTL=127 ID=49243 PROTO=UDP SPT=1090 DPT=53 LEN=42
-----

which means that somehow Linux confuses input interface and output  in
the same: "IN=eth0 OUT=eth0". 

This is my rc.firewall script:

-----
[alucard@servidor alucard]$ more /etc/rc.d/rc.firewall
#!/bin/sh
FWVER=0.74
IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe

EXTIF="eth1"
INTIF="eth0"

echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"
echo -en "   loading modules: "
$DEPMOD -a
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
echo "   Habilitando Mascaras IP.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   Habilitando DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT

$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 22 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

$IPTABLES -A FORWARD -j LOG


$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
-----

What's odd here is that if I reboot the computer, I'd still get the same
log message but if I do this:

ifconfig eth0 down
ifconfig eth1 down
ifconfig eth0 192.168.0.1 #router's address
ifconfig eth1 up #DHCP internet access

it will work -but not always, sometimes both interfaces do not ping
anybody- but it will quit working after an hour or so not allowing any
other services -like internal ftp or mail fetching- and I'll start
having those logs again... I have checked all the box for any security
issues and I haven't found any- I have latest packages due to a red hat
network subscription-. What's weird is that it worked flawlessly for 6
months... 

Thanks a lot for your time...

Juan


