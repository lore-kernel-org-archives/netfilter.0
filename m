From: "Mike T." <mkakazu@shaw.ca>
Subject: DMZ with iptables
Date: Sat, 16 Aug 2003 13:24:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <bhm3u7$j8s$1@sea.gmane.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I got the firewall working fine, but I can't seem to get the DMZ
working....Please help!

Here's my script

----------------------------------------------------------------------------
----
#!/bin/sh
# Firewall script

iptables=/sbin/iptables

intif="eth0"
lan="eth2"
dmz="eth1"
dmz_ip="10.0.0.0/32"

/sbin/depmod -a

/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack_ftp

$iptables -P INPUT DROP
$iptables -F INPUT
$iptables -P OUTPUT ACCEPT
$iptables -P OUTPUT DROP
$iptables -F OUTPUT
$iptables -P FORWARD DROP
$iptables -F FORWARD
$iptables -t nat -F

$iptables -t nat -A POSTROUTING -o $intif -j MASQUERADE

# Drops anything new from outside (Internet)
#$iptables -A FORWARD -i $intif -m state ! --state NEW -j DROP

#
# IP Spoofing
#
$iptables -t nat -A PREROUTING -i $intif -s 192.168.0.0/16 -j DROP
$iptables -t nat -A PREROUTING -i $intif -s 10.0.0.0/8 -j DROP
$iptables -t nat -A PREROUTING -i $intif -s 172.16.0.0/24 -j DROP

#
# DMZ zone
#
$iptables -t nat -A PREROUTING -p TCP -m multiport -i $intif \
--dport 22,25,113,80,8080 -j DNAT --to 10.0.0.10
$iptables -t nat -A PREROUTING -p UDP -i $intif --dport 25 -j
DNAT --to-destination 10.0.0.10


#
#$iptables -A FORWARD -p TCP -i $intif -o $dmz -d $dmz_ip --dport 80 -j
allowed


$iptables -A FORWARD -i $dmz -o $intif -j ACCEPT
$iptables -A FORWARD -i $intif -o $dmz -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$iptables -A FORWARD -i $lan -o $dmz -j ACCEPT
$iptables -A FORWARD -i $dmz -o $lan -j ACCEPT


#
# LAN Section
#
$iptables -A FORWARD -i $lan -j ACCEPT
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT



$iptables -A INPUT -p ALL -i $lan -d 192.168.1.0/16 -j ACCEPT

# All established and related packets incoming from the internet to the
firewall
$iptables -A INPUT -p ALL -i $intif -m state \
--state ESTABLISHED,RELATED -j ACCEPT

$iptables -A OUTPUT -p ALL -s 192.168.1.0/16 -j ACCEPT
$iptables -A OUTPUT -p ALL -s 127.0.0.1/32 -j ACCEPT

----------------------------------------------------------------------------
------------------------------------








