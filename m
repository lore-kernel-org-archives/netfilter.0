From: "Daniel J. Brennan" <djbrennan@comcast.net>
Subject: Network number getting mangled
Date: Tue, 1 Mar 2005 16:47:25 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello Netfilter,

I have a Fedora Core 1.0 linux box (iptables-1.2.9-1.0) NATing traffic
from a private network onto a valid public network. The private network
IP address space essentially mirrors the public IP address space. For
example the public space is XX.XX.168.0/18, hence the private space
looks like 10.0.168.0/18. 

The problem I have is related to the netmask value. The netmask /18 is
actually mangling the third octet of the network number. For example if
I append a rule:

	iptables -A INPUT -i eth0 -p icmp -s 10.0.168.0/18 -j ACCEPT

A listing of the INPUT Chain shows the corresponding rule with the
network as 10.0.128.0/18. This doesn't seem to occur if the netmask is
/22. If I set the netmask to /20 the network number then looks like
10.0.160.0/20. I have no idea how this can happen. Is this a bug or am I
misconfiguring something. The pertinent portions of the configuration
are included below along with the output from "iptables -L -v"

Thanks for any help.
Dan


________________________________________________________________________
Some Variables

        # EUD Network (public)
        EUD_IP="XX.XX.172.87"
        EUD_IFACE="eth0"
        EUD_BCAST="XX.XX.175.255"
        EUD_NET_RANGE="XX.XX.168.0/18"

        # Private Network
        PNET_IP="10.0.168.1"
        PNET_IFACE="eth1"
        PNET_RANGE="10.0.168.0/18"

        # Loopback device
        LO_IP="127.0.0.1"
        LO_IFACE="lo"
________________________________________________________________________

Iptables rules

#
# USER CHAIN: dhcp-query
#
iptables -A dhcp-query -p udp -s $BROADCAST_SRC \
          -d $BROADCAST_DEST --dport 67 -j ACCEPT
iptables -A dhcp-query -p udp -s $BROADCAST_SRC \
          -d $PNET_IP --dport 67 -j ACCEPT
iptables -A dhcp-query -p udp -s $PNET_RANGE \
          -d $PNET_IP --dport 67 -j ACCEPT
# Drop everything else
iptables -A dhcp-query -s 0/0 -j REJECT

#
# USER CHAIN: dhcp-reply
#
iptables -A dhcp-reply -p udp -s $BROADCAST_SRC \
          -d $BROADCAST_DEST --dport 68 -j ACCEPT
iptables -A dhcp-reply -p udp -s $PNET_IP \
          -d $BROADCAST_DEST --dport 68 -j ACCEPT
iptables -A dhcp-reply -p udp -s $PNET_IP \
          -d $PNET_RANGE --dport 68 -j ACCEPT
# Drop everything else
iptables -A dhcp-reply -s 0/0 -j REJECT

#
# USER CHAIN: in-icmp-packets
#
iptables -A in-icmp-packets -i $EUD_IFACE -s $EUD_NET_RANGE -p icmp \
          --icmp-type 8  -j ACCEPT
iptables -A in-icmp-packets -i $EUD_IFACE -s $EUD_NET_RANGE -p icmp \
          --icmp-type 0  -j ACCEPT
iptables -A in-icmp-packets -i $PNET_IFACE -s $PNET_RANGE -p icmp \
          --icmp-type 0  -j ACCEPT
# Drop everything else
iptables -A in-icmp-packets -s 0/0 -j DROP

#
# USER CHAIN: out-icmp-packets
#
iptables -A out-icmp-packets -p icmp \
          --icmp-type 8  -j ACCEPT
iptables -A out-icmp-packets -p icmp \
          --icmp-type 0  -j ACCEPT
# Drop everything else
iptables -A out-icmp-packets -s 0/0 -j DROP
________________________________________________________________________

Output from iptables -L -v | awk '/Chain (dhcp|.*icmp)/,/^$/'

Chain dhcp-query (1 references)
 pkts bytes target     prot opt in     out     source
destination
    4  1312 ACCEPT     udp  --  any    any     0.0.0.0
255.255.255.255     udp dpt:bootps
    0     0 ACCEPT     udp  --  any    any     0.0.0.0
10.0.168.1          udp dpt:bootps
    2  1208 ACCEPT     udp  --  any    any     10.0.128.0/18
10.0.168.1          udp dpt:bootps
    0     0 REJECT     all  --  any    any     anywhere
anywhere            reject-with icmp-port-unreachable

Chain dhcp-reply (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     udp  --  any    any     0.0.0.0
255.255.255.255     udp dpt:bootpc
    0     0 ACCEPT     udp  --  any    any     10.0.168.1
255.255.255.255     udp dpt:bootpc
    0     0 ACCEPT     udp  --  any    any     10.0.168.1
10.0.128.0/18       udp dpt:bootpc
    0     0 REJECT     all  --  any    any     anywhere
anywhere            reject-with icmp-port-unreachable

Chain fwd-icmp-packets (1 references)
 pkts bytes target     prot opt in     out     source
destination

Chain in-icmp-packets (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     icmp --  eth0   any     XX.XX.128.0/18
anywhere            icmp echo-request
    0     0 ACCEPT     icmp --  eth0   any     XX.XX.128.0/18
anywhere            icmp echo-reply
    0     0 ACCEPT     icmp --  eth1   any     10.0.128.0/18
anywhere            icmp echo-reply
    1    78 DROP       all  --  any    any     anywhere
anywhere

Chain out-icmp-packets (1 references)
 pkts bytes target     prot opt in     out     source
destination
    1    48 ACCEPT     icmp --  any    any     anywhere
anywhere            icmp echo-request
    0     0 ACCEPT     icmp --  any    any     anywhere
anywhere            icmp echo-reply
    0     0 DROP       all  --  any    any     anywhere
anywher 

