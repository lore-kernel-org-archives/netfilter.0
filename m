From: Pawel Hadam <Pawel.Hadam@imag.fr>
Subject: ROUTE and source IPv6 routing - how ?
Date: Mon, 1 Dec 2003 16:22:17 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.33.0312011606350.27223-100000@horus.imag.fr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: delaunois@info.ucl.ac.be

Hi all

I have two hosts and both have two NICs.

CLIENT: eth0 - ipc0 = 2001:660:5301:26:2c0:9fff:fe1a:caca
        eth1 - ipc1 = 2001:688:1fa1:2:204:75ff:fef8:93a4

SERVER: eth0 - ips0 = 2001:660:5301:26:210:5aff:febe:bb78
        eth1 - ips1 = 2001:688:1fa1:2:204:75ff:fee8:52fd

As you can see, both eth0 are connected to the same LAN (so have IPv6
addresses from the same LAN), and both eth1 are connected to the second
LAN.

According to the normal IPv6 routing, all packets exit from CLIENT to ips0
always via eth0, and to ips1 always via eth1.

But when I have a client program bound to ipc0 (src = ipc0) I would like
to see all packets exiting via eth0, both packets going to ips0 and to
ips1. The same way, packets from a client bound to ipc1 (src = ipc1)
should always exit via eth1. Like this:

1) (ipc0 -> ips0) via eth0
2) (ipc0 -> ips1) via eth0
3) (ipc1 -> ips0) via eth1
4) (ipc1 -> ips1) via eth1


To obtain this I used kernel 2.4.22 with netfilter and patch-o-matic
module ROUTE, and configured this way:


mykonos:~ # ip6tables -t mangle -A POSTROUTING --source
2001:660:5301:26:2c0:9fff:fe1a:caca -j ROUTE --oif eth0 --continue

mykonos:~ # ip6tables -t mangle -A POSTROUTING --source
2001:688:1fa1:2:204:75ff:fef8:93a4 -j ROUTE --oif eth1 --continue

mykonos:~ # ip6tables -t mangle -nL
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
ROUTE      all      2001:660:5301:26:2c0:9fff:fe1a:caca/128  ::/0
ROUTE oif:eth0 continue
ROUTE      all      2001:688:1fa1:2:204:75ff:fef8:93a4/128  ::/0
ROUTE oif:eth1 continue


But it works only in cases 1) and 4). In cases 2) and 3) it gives the
following messages in /var/log/messages:


Dec  1 15:52:29 mykonos kernel: ip6t_ROUTE: no explicit route found via
interface eth1

Dec  1 15:52:45 mykonos kernel: ip6t_ROUTE: called with:
DST=2001:0688:1fa1:0002:0204:75ff:fee8:52fd
GATEWAY=0000:0000:0000:0000:0000:0000:0000
:0000 OUT=eth0

Dec  1 15:52:45 mykonos kernel: ip6t_ROUTE: no explicit route found via
interface eth0

Dec  1 15:52:48 mykonos kernel: ip6t_ROUTE: called with:
DST=2001:0688:1fa1:0002:0204:75ff:fee8:52fd
GATEWAY=0000:0000:0000:0000:0000:0000:0000
:0000 OUT=eth0



And I cannot see any packet exiting any interface.

Could anybody help me with this configuration to reach my target, please
??? Or maybe I should change something in my routing table ???

Regards
Pawel


