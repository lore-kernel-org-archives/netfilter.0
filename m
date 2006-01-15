From: "Paul Lewis" <paul.lewis@st-annes.oxford.ac.uk>
Subject: Network configuration
Date: Sun, 15 Jan 2006 18:36:37 -0000
Message-ID: <000301c61a02$9f6f3500$6402a8c0@sannpjl>
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
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

Hi,

Apologies for the cross-posting; I'm not sure whether this is a firewall or
routing issue, or both!

I have four network cards, detailed below. eth0 and eth3 connect to my ISPs,
and eth1 and eth2 connect to local networks. I want to route all traffic
from eth2 to eth0, and from eth1 to eth3. However, I am having a few
problems with this.

eth0
ip: 192.168.100.253/24
gw: 192.168.100.254 (ISP)

eth1
ip: 192.168.3.253/22
gw: 192.168.20.253 (eth3)

eth2
ip: 192.168.7.253/22
gw: 192.168.100.253 (eth0)

eth3
ip: 192.168.20.253/24
gw: 192.168.20.254 (ISP)

I have tried setting up routing using these commands:

echo "ISP_1" >> /etc/iproute2/rt_tables
echo "ISP_2" >> /etc/iproute2/rt_tables

ip route add 192.168.4.0/22 dev eth2 src 192.168.7.253 table ISP_1
ip route add default via 192.168.100.253 table ISP_1
ip route add 192.168.0.0/22 dev eth1 src 192.168.3.253 table ISP_2
ip route add default via 192.168.20.253 table ISP_2

ip rule add from 192.168.7.253 table ISP_1
ip rule add from 192.168.3.253 table ISP_2

However, this yielded no success. I have also tried a simple iptables
forwarding configuration (without the routing config above):

iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT

# default policy
iptables -P FORWARD DROP

Again, with no success. I do have a reasonably complex firewall in place,
but no other rules in the FORWARD section of the firewall. I have a number
of open ports under INPUT for other services the machine provides, and
nothing under OUTPUT.

In the NAT section, I have no rules in OUTPUT, a couple of MASQUERADING
rules under POSTROUTING, and hundreds of rules under PREROUTING (accepting
or denying machines based on their MAC).

I've had a few thoughts on this; do I need to have four default gateways
configured; one for each network card? And do I need more (or any)
forwarding rules in the firewall?

I've been struggling with this problem for some time now, and it's really
starting to annoy me. I would really appreciate any feedback people could
send me.

Many thanks,

Paul

---
Paul Lewis (paul.lewis@st-annes.ox.ac.uk)
Part II Student
Department Of Materials
University Of Oxford




