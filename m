From: Magnus Solvang <magnus@solvang.net>
Subject: Port Forwarding for port 25 (again...)
Date: Tue, 25 Feb 2003 01:54:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225005407.GA28447@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.samba.org

I have a firewall set up with an internal (192.168.1.20) and
an external ip-address (x.x.x.49). The former mailserver for
this domain has been placed on the LAN, and given the address
192.168.1.101. MX for the domain still points to its old
ip-address (x.x.x.34). The firewall is behind the router for
the external domain.

I'm can't seem to be able to forward smtp-traffic from x.x.x.34
to 192.168.1.101 via the firewall. I _am_ able to forward port
25 from the firewalls external interface to the mailserver behind,
but as mentioned - not from the former ip-address of the mailserver,
and to the new internal address.

I have tried numerous versions of:
$IPTABLES -t nat -A PREROUTING -i $INET_NCARD -d x.x.x.34 -p tcp \
--dport 25 -j DNAT --to-destination 192.168.1.101:25

But a telnet to the old, external ip-address of the mailserver
just hangs (untill it returns a "No route to host".

Unfortunatly, I have copied parts from various firewall-scripts
around the net, but I think I'm understanding most of it now.

Below are different output from iptables -L
I could ask them to change MX to point to the firewall, but
I'm hoping to avoid it, if possible.

- M


# iptables -v -L -t nat
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DNAT       tcp  --  any    any     anywhere             anywhere           tcp dpt:http to:192.168.1.101
    0     0 DNAT       tcp  --  eth1   any     anywhere             193.69.71.49       tcp dpt:smtp to:192.168.1.101

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 MASQUERADE  all  --  any    any     192.168.1.0/24       anywhere
    0     0 SNAT       all  --  any    eth0    anywhere             anywhere           to:193.69.71.49

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination


# iptables -v -L FORWARD
Chain FORWARD (policy ACCEPT 259 packets, 16059 bytes)
 pkts bytes target     prot opt in     out     source               destination
  486 29545 bad_tcp_packets tcp -- any any     anywhere       anywhere
    0     0 ACCEPT     tcp  --  eth1   eth0    anywhere             192.168.1.101      state NEW,RELATED,ESTABLISHED tcp dpt:smtp
  325 23403 ACCEPT     all  --  eth0   eth1    anywhere             anywhere
    4   355 LOG        all  --  any    any     anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT FORWARD packet died: '


# iptables -v -L INPUT
Chain INPUT (policy ACCEPT 6 packets, 759 bytes)
 pkts bytes target     prot opt in     out     source               destination
   99  7212 bad_tcp_packets  tcp  --  any    any     anywhere       anywhere
    2   318 ACCEPT     all  --  eth0   any     192.168.1.0/24       anywhere
    0     0 ACCEPT     all  --  lo     any     localhost.localdomain anywhere
    0     0 ACCEPT     all  --  lo     any     192.168.1.20         anywhere
   19  1444 ACCEPT     all  --  lo     any     x.x.x.49             anywhere
    0     0 ACCEPT     all  --  eth0   any     anywhere             192.168.1.255
    0     0 ACCEPT     udp  --  eth0   any     anywhere             anywhere           udp spt:bootpc dpt:bootps
  103  7797 ACCEPT     all  --  any    any     anywhere             x.x.x.49            state RELATED,ESTABLISHED
    0     0 tcp_packets  tcp  --  eth1   any     anywhere           anywhere
    2   292 udp_packets  udp  --  eth1   any     anywhere           anywhere
    0     0 icmp_packets  icmp --  eth1   any    anywhere           anywhere
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere           state NEW,ESTABLISHED tcp dpt:smtp
    6   759 LOG        all  --  any    any     anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT INPUT packet died: '


# iptables -v -L OUTPUT
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
   94 13672 bad_tcp_packets  tcp  --  any    any     anywhere       anywhere
    0     0 ACCEPT     all  --  any    any     localhost.localdomain anywhere
    0     0 ACCEPT     all  --  any    any     192.168.1.20         anywhere
  128 16212 ACCEPT     all  --  any    any     x.x.x.49             anywhere
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere           state RELATED,ESTABLISHED tcp spt:smtp
    0     0 LOG        all  --  any    any     anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT OUTPUT packet died: '

