From: iptables-user <iptables@theorb.net>
Subject: some addresses won't route
Date: Sun, 18 Sep 2005 12:14:00 -0700
Message-ID: <432DBC78.8070504@theorb.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi list members,

I created what I thought was a simple 3 network router which worked 
great for 4 or 5 days, but has gone bonkers.  Restarting it doesn't make 
it work correctly, neither does rebooting.  I have a hunch that 
something in a cache somewhere may have expired or one of the flags in 
the /proc tree changed but I sure don't know what.

I'm using unpatched iptables-1.2.11 on fc4 with unmodified kernel.

Box is setup as a router with a WAN, DMZ, and LAN.  WAN traffic DNAT'd 
to DMZ works. DMZ and LAN through WAN works. The problems show up in LAN 
to DMZ traffic.

 From LAN to/through DMZ ping (icmp), dns (udp and tcp), and ssh work 
fine. pop3 and smtp work, but only after a looong wait, much longer than 
a dns timeout. http works on one DMZ'd server, but on another webserver 
with 2 IPs will only connect to one of the IPs (the one that the 
webserver is NOT listening to, but works correctly for WAN traffic).

Sniffing with tcpdump on DMZ for pop3 or smtp traffic shows syn/ack/ack 
followed by a minutes long wait.  Sniffing for http on DMZ shows correct 
traffic for D.M.Z.12, but for D.M.Z.11 never shows up on the DMZ 
interface (11 and 12 are on the same dev).  Switching the order the 
addresses are added to the interface has no effect.

All nics on all machines are brought up with "ifconfig ethX up" and 
addresses are attached using "ip addr add a.b.c.d/nm dev ethX".  Default 
routes are created, and on the router /proc/sys/net/ipv4/ip_forward is 
set to "1".

On all machines ifconfig, ip addr show, and route display expected results.

The puzzler is that it worked so well for 4 or 5 days.

Here is the iptables rule set which gets loaded using iptables-restore.

##########  VERY BASIC 3-LEGGED FIREWALL/ROUTER  ###########
#
# [eth0] LAN is L.A.N.1   /24 (private)
# [eth1] WAN is W.A.N.1-5 /29 (dsl to internet)
# [eth2] DMZ is D.M.Z.1   /24 (servers)
#
*nat
# remember: only NEW connections go through PREROUTING
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:GO_1 - [0:0]
:GO_2 - [0:0]
:GO_3 - [0:0]
:GO_4 - [0:0]
:GO_5 - [0:0]
# filtering belongs in filter table...
-A PREROUTING -p icmp -j RETURN
# divvy ip's into chains; it's faster
-A PREROUTING -d W.A.N.1 -j GO_1
-A PREROUTING -d W.A.N.2 -j GO_2
-A PREROUTING -d W.A.N.3 -j GO_3
-A PREROUTING -d W.A.N.4 -j GO_4
-A PREROUTING -d W.A.N.5 -j GO_5
# round-robin source ip's make visual log inspection easier for me
-A POSTROUTING -o WAN -j SNAT --to-source W.A.N.1-W.A.N.5
# DNAT maps
#  eg: -I GO_3 -p tcp --dport 80 -j DNAT --to-destination D.M.Z.100
#    would map http://W.A.N.3 to http://D.M.Z.100
-A GO_1 -j DROP
-A GO_2 -j DROP
-A GO_3 -j DROP
-A GO_4 -j DROP
-A GO_5 -j DROP
COMMIT
#
*filter
:INPUT   DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
# ok, so i'm an idiot. i like to talk to myself
-A INPUT -i lo -j ACCEPT
# wan is shy
-A INPUT -i WAN -p icmp -j DROP
# but the rest of us aren't :)
-A INPUT -p icmp -j ACCEPT
# allow router administration from lan
-A INPUT -s L.A.N.0/255.255.255.0 -d L.A.N.1 -p tcp -m tcp --dport 22 -j 
ACCEPT
#
# let it route...
-A FORWARD -o DMZ -j ACCEPT
# let it route...
-A FORWARD -o WAN -j ACCEPT
# lan offers no services
-A FORWARD -o LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT

Any ideas?  I'm at my (half) wits end.

Thanks for any help,
San Jose Mike

