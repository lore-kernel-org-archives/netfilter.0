From: "Ryan Hatch" <spam@leadership-solutions.net>
Subject: IPtables and iproute2
Date: Sun, 8 Aug 2004 23:33:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Bu2mz-0008Sw-UK@vishnu.netfilter.org>
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

I have a seemingly basic situation here but I have thus far been very
unsuccessful in getting my routing to work.

I have an internal network (192.168.0.*) with many users that do filesharing
and access the internet through 192.168.0.1...my linux box doing NAT and
connected to a T1.  I also have a nokia vpn box that I want to use for just
2 clients.  I want to keep everybody on the 192.168.0 network (including the
two vpn clients) and just have the 192.168.0.110 and 111 hosts get their
addresses statically NAT-ed to the VPN address.  Example:  My router's
address is 1.2.3.1.  I want to statically NAT 192.168.0.100 to 1.2.3.2 and
192.168.0.101 to 1.2.3.3.  My thinking was to do something like this:

-A PREROUTING -d 1.2.3.2 -i eth0 -j DNAT --to-destination 192.168.0.100
-A POSTROUTING -s 192.168.0.100 -o eth0 -j SNAT --to-source 1.2.3.2
-A PREROUTING -d 1.2.3.3 -i eth0 -j DNAT --to-destination 192.168.0.101
-A POSTROUTING -s 192.168.0.101 -o eth0 -j SNAT --to-source 1.2.3.3

I gave this box both 1.2.3.2 and 1.2.3.3 in order to perform the 1-to-1 nat.

I then added the following line to the end of my /etc/iproute2/rt_tables
file:

200 VPNClients

I ran the following commands:
$ip rule add from 1.2.3.2 table VPNClients
$ip rule add from 1.2.3.3 table VPNClients

$ip route add default via 1.2.3.1 dev eth0 table VPNClients
$ip flush cache

It seems to me that the clients 192.168.0.100 and 192.168.0.100 should both
be now routing through the router (192.168.0.1) and then getting their
addresses translated to 1.2.3.2 and 1.2.3.3 respectively.  Their packets
should be then routed via eth 0 to the 1.2.3.1 VPN router which is
configured to then route out to the internet on my cisco router.  

I have also this line in my iptables config:
-A POSTROUTING -s 192.168.0.0/24 -j SNAT -o eth0 --to-source x.x.x.x (my
linux box's public internet address)

With this configuration, it seems that all other boxes other than the
192.168.0.100 and 192.168.0.101 will be normally NAT-ed and can access the
internet through my cisco.  The 100 and 101 addresses will be routed to the
VPN router first, and then the vpn router will route out.

For some reason this configuration doesn't seem to work. When I am on my
192.168.0.101 box, I cannot get out beyond 192.168.0.1.

I know this is a pretty lengthy description.  I hope that somebody out there
might shed a little light on it for me.  If I have omitted important
details, please let me know.

Thanks in advance,

Ryan Hatch

------------------------------------------
Information wants to be anthropomorphized.
------------------------------------------




