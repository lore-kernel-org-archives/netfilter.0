From: egilmore <egilmore@vt.edu>
Subject: again, firewall help....
Date: Tue, 2 Mar 2004 11:13:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407075C6@zathras>
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
To: netfilter@lists.netfilter.org

Can anyone give me a clue?  The basics are:
1 machine: SuSE 8.2
3 nics
2 internal networks (examples):
$INTLAN1:> 192.0.0.2   $INTLAN2:> 192.0.5.2
 
3 good ip's (examples):
eth0> 128.0.0.1   eth0:1> 128.0.0.2   eth0:2> 128.0.0.3
 
2 spoofed ip's:
$INTIF1> 192.0.5.2  $INTIF2> 192.0.48.3
 
works:
-connecting from the internet/external LAN to all machines via (ssh, FTP, 
HTTP)
 
not:
-connecting between $INTLAN1 & $INTLAN2 
-samba connections from anywhere
-afp (apple) connections from anywhere
 
-Thanks in advance....

#!/bin/sh
PATH="$PATH:/usr/bin/:/usr/sbin"
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod
EXTIF=eth0
INTIF1=eth1
INTIF2=eth2

case "$1" in
'start')
        echo "Clearing any existing rules and setting default policy.."
	iptables -P INPUT ACCEPT
	iptables -P OUTPUT ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -F
	iptables -F INPUT
	iptables -F OUTPUT
	iptables -F FORWARD
	iptables -X
	iptables -t nat -F
# loopback rules
	iptables -A INPUT -i lo -j ACCEPT
	iptables -A OUTPUT -o lo -j ACCEPT
	iptables -A INPUT -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
	iptables -A OUTPUT -o $EXTIF -m state --state NEW,ESTABLISHED,RELATED  -j 
ACCEPT
	iptables -A INPUT -i $EXTIF -j ACCEPT
echo "Adding Masquerade support for 192.0.0.0 subnet..."
	iptables -A FORWARD -i $EXTIF -o $INTIF1 -m state --state ESTABLISHED,RELATED 
-j ACCEPT
	iptables -A FORWARD -i $INTIF1 -o $EXTIF -j ACCEPT
       echo "Adding Masquerade support for 192.0.5.0 subnet..."
	iptables -A FORWARD -i $EXTIF -o $INTIF2 -m state --state ESTABLISHED,RELATED 
-j ACCEPT
	iptables -A FORWARD -i $INTIF2 -o $EXTIF -j ACCEPT
echo "Allowing traffic between internal networks..."
	iptables -A FORWARD -i $INTIF1 -o $INTIF2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
	iptables -A FORWARD -i $INTIF2 -o $INTIF1 -j ACCEPT
	iptables -A FORWARD -i $INTIF2 -o $INTIF1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
	iptables -A FORWARD -i $INTIF1 -o $INTIF2 -j ACCEPT
	iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
echo "Associating internal address 192.0.0.2 with external address 128.0.0.2"
	iptables -t nat -A PREROUTING -p tcp --dst 128.0.0.2 -j DNAT --to-destination 
192.0.0.2
	iptables -t nat -A PREROUTING -p udp --dst 128.0.0.2 -j DNAT --to-destination 
192.0.0.2
	iptables -t nat -A PREROUTING -p icmp --dst 128.0.0.2 -j DNAT 
--to-destination 192.0.0.2
	iptables -t nat -A POSTROUTING -p tcp --dst 128.0.0.2 -j SNAT --to-source 
192.0.0.2
	iptables -t nat -A POSTROUTING -p udp --dst 128.0.0.2 -j SNAT --to-source 
192.0.0.2
	iptables -t nat -A POSTROUTING -p icmp --dst 128.0.0.2 -j SNAT --to-source 
192.0.0.2
echo "Associating internal address 192.0.5.2 with external address 128.0.0.3"
	iptables -t nat -A PREROUTING -p tcp --dst 128.0.0.3 -j DNAT --to-destination 
192.0.5.2
	iptables -t nat -A PREROUTING -p udp --dst 128.0.0.3 -j DNAT --to-destination 
192.0.5.2
	iptables -t nat -A PREROUTING -p icmp --dst 128.0.0.3 -j DNAT 
--to-destination 192.0.5.2
	iptables -t nat -A POSTROUTING -p tcp --dst 128.0.0.3 -j SNAT --to-source 
192.0.5.2
	iptables -t nat -A POSTROUTING -p udp --dst 128.0.0.3 -j SNAT --to-source 
192.0.5.2
	iptables -t nat -A POSTROUTING -p icmp --dst 128.0.0.3 -j SNAT --to-source 
192.0.5.2
# add logging
	iptables -A INPUT -j LOG
	#iptables -A FORWARD -j LOG
	#iptables -t nat -A PREROUTING -j LOG
	#iptables -t nat -A POSTROUTING -j LOG
	#iptables -A OUTPUT -j LOG
	#iptables -A block -j LOG
;;
'stop')
	echo "Flushing iptables firewall..."
	iptables -P INPUT ACCEPT
	iptables -F INPUT
	iptables -P OUTPUT ACCEPT
	iptables -F OUTPUT
	iptables -P FORWARD DROP
	iptables -F FORWARD
	#iptables -F block
	iptables -t nat -F
;;
'restart')
        $0 stop
	$0 start
;;
*)
	echo "$0 {start|stop}"
	exit 1
;;
esac
exit 0


