From: "Filip Moritz" <moritz@ieb.net>
Subject: deamon answering packets though dropped
Date: Tue, 25 Jan 2005 13:58:12 +0100
Message-ID: <E1CtQHF-0003zz-00@deer.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


Sorry, 't was late last night, I forgot the subject.
So again:

Hi everyone.

Didn't post here yet, but I hope someone will enlighten my sorrow:
I'm afraid to observe incoming packets being answered by a local process,
though dropped by iptables.

On a firewall between our workstations and servers i run dhcrelay, for
obvious reasons. Unfortunately the devices, dhcrelay answers broadcasts vs
asks the server on, are not configurable seperately. So it also answers dhcp
request broadcasts on the server network. As i use netbooting from time to
time to install or maintain servers, this actually happens. So I added a
rule to avoid broadcast packets from the servers' network to reach the
firewall machine:

# iptables -I INPUT -i ! eth0 -s 0.0.0.0 -j DROP
# iptables -L INPUT -v
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  !eth0  any     0.0.0.0              anywhere
[ ... more rules ]

When now doing DHCP requests [*] from the server's network, I get replies
not only from my DHCP servers [+], but also from the firewall's internal
interface [x]:

# tcpdump -i eth1 host 0.0.0.0 or 255.255.255.255
[*]	16:29:38.415090 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
BOOTP/DHCP, Request from <pxe client's hw-addr>
[+]	16:29:38.415840 IP <server5's ip>.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[+]	16:29:38.415846 IP <server4's ip>.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[x]	16:29:38.415913 IP 192.168.10.1.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[x]	16:29:38.416245 IP 192.168.10.1.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[*]	16:29:46.434416 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
BOOTP/DHCP, Request from <pxe client's hw-addr>
[+]	16:29:46.434781 IP <server5's ip>.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[x]	16:29:46.435218 IP 192.168.10.1.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[*]	16:29:54.453295 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
BOOTP/DHCP, Request from <pxe client's hw-addr>
[x]	16:29:54.463872 IP 192.168.10.1.bootps > 255.255.255.255.bootpc:
BOOTP/DHCP, Reply
[ ... three more times all the same ]


...although the same nine (3x3) request packets seem to have been dropped:

# iptables -L INPUT -v
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    9  5184 DROP       all  --  !eth0  any     0.0.0.0              anywhere
[ ... more rules ]


To be sure, I tried several times. When dhcrelay is not running, voila, no
more replies from 192.168.10.1.


on the other hand,

# iptables -I OUTPUT -o ! eth0 -d 255.255.255.255 -j DROP

doesn't match any of those dhcp replies:

# iptables -L OUTPUT -v
Chain OUTPUT (policy DROP 18 packets, 1232 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  any    !eth0   anywhere
255.255.255.255


So is this any sane?


Environment:
Our firewall is separating two subnets: 192.168.10.0/24 (workstations) on
eth0 and  192.168.10.0/28 (servers) on eth1. For traffic from workstations
to servers being sent to the firewall, arp-cacheing is turned on for eth0.
The other direction is done by having manually set up a more narrow netmask
(the /28) on the servers and the firewall's eth1 (192.168.10.1) as default
gateway. This generally works pretty fine.


appreciating any thoughts,
g., fil



