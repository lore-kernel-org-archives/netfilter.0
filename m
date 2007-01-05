From: "Joshua Perry" <josh@6bit.com>
Subject: GRE Packet in IPSec not Inbound?
Date: Thu, 4 Jan 2007 23:54:53 -0700
Message-ID: <00ea01c73096$671bc7d0$35535770$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Language: en-us
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

Hey guys I have a problem trying to use iptables on a machine that has an
GRE tunnel over IPSec Transport mode VPN to another host.  I am using
Shorewall to configure iptables but the problem I am having isn't strictly
Shorewall specific.  Using built-in Kernel 2.6.18 ipsec in transport mode
and GRE tunneling on top of that.

Shorewall makes rule in INPUT for each interface and each of those rules
points at an interface specific chain:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
  367 32973 eth0_in    all  --  eth0   *       0.0.0.0/0
0.0.0.0/0
    4   336 vpn1_in    all  --  vpn1   *       0.0.0.0/0
0.0.0.0/0
   70  9768 vlan4_in   all  --  vlan4  *       0.0.0.0/0
0.0.0.0/0
   32  3482 Reject     all  --  *      *       0.0.0.0/0
0.0.0.0/0
   29  3248 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 6 prefix `Shorewall:INPUT:REJECT:'
   29  3248 reject     all  --  *      *       0.0.0.0/0
0.0.0.0/0

Then the interface specific chain has a rule for any "zones" that it has
configurations for:

Chain vlan4_in (1 references)
 pkts bytes target     prot opt in     out     source
destination
   31  3512 dynamic    all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID,NEW
   37  6072 inet2fw    all  --  *      *       0.0.0.0/0
0.0.0.0/0           policy match dir in pol none

This shows that interface vlan4 has a configuration to match traffic from
the internet "zone" to the firewall "zone".  And that chain has the rules
that corresponds to that configuration:

Chain inet2fw (2 references)
 pkts bytes target     prot opt in     out     source
destination
   40  6520 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22
    1   152 ACCEPT     esp  --  *      *       67.42.31.242
0.0.0.0/0
    0     0 ACCEPT     udp  --  *      *       67.42.31.242
0.0.0.0/0           udp dpt:500
    1   112 ACCEPT     47   --  *      *       67.42.31.242
0.0.0.0/0
    0     0 inet2all   all  --  *      *       0.0.0.0/0
0.0.0.0/0

Ok so the problem I have is that in the interface chain for the interface
that is connected to the internet Shorewall puts a policy match filter "--m
policy --dir in --pol none" When the ESP packets come in it matches that
policy because it is inbound.  The GRE packet that gets excised from the ESP
begins again at INPUT but that packet does not match that rule for some
reason.  At first I wasn't sure if this was by design or not so I manually
put in a jump rule without the policy match which worked good.

Once the actual data packet is then excised from the GRE packet it starts at
INPUT again but on the GRE tunnel virtual interface "vpn1".  The "zone" rule
for this interface has the same policy match filter, but this time the
packet matches the "--m policy --dir in --pol none" match:

Chain vpn1_in (1 references)
 pkts bytes target     prot opt in     out     source
destination
    4   336 dynamic    all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID,NEW
    4   336 evl2fw     all  --  *      *       0.0.0.0/0
0.0.0.0/0           policy match dir in pol none

Chain evl2fw (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0

Does this seem a little inconsistent or is this how it is supposed to work?
The only difference I see is that the ESP packet and the GRE packet that is
removed from it have the same inbound interface in common, and the data
packet in the GRE packet then switches to the vpn1 virtual interface.

Any input appreciated,

Josh


