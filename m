From: "Paul Lewis" <paul.lewis@st-annes.oxford.ac.uk>
Subject: Firewall.routing configuration problems
Date: Thu, 20 Oct 2005 17:40:38 +0100
Message-ID: <003c01c5d595$00853360$e7544381@SANNPJLTABLET>
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
To: netfilter@lists.netfilter.org, lartc@mailman.ds9a.nl

Hi,

I am trying to set up a linux box to act as a router for my college. There
are two different types of users; students and conference guests, and they
have IPs statically assigned by DHCP, from separate ranges (but they are on
the same subnet). The students go out onto an academic connection (via
eth0), and conference guests go out on an ADSL line (via eth3). eth1 and
eth2 are configured for internal use.

My question is this (and I'm not 100% sure if it's a firewall or routing
issue, hence the post to both mailing lists). I have some firewall rules in
place which direct packets out to a specific ethernet device, depending on
the IP that the packet is coming from. It will probably help if I define the
IPs, subnets and netmasks etc for the ethernet devices:

eth0      Link encap:Ethernet  HWaddr 00:14:22:09:FB:1A
          inet addr:192.168.100.253  Bcast:192.168.100.255
Mask:255.255.255.0

eth1      Link encap:Ethernet  HWaddr 00:04:23:BB:89:9C
          inet addr:192.168.7.253  Bcast:192.168.7.255  Mask:255.255.248.0

eth3      Link encap:Ethernet  HWaddr 00:14:22:09:FB:1B
          inet addr:192.168.20.253  Bcast:192.168.20.255  Mask:255.255.255.0

Students have an IP in the range 192.168.4.1-192.168.6.253, and conference
guests have an IP in the range 192.168.0.1-192.168.3.253. The firewall rules
for routing packets to the correct ethernet device (conference guests to
eth3 and students to eth0) are as follows:

	iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE -o
eth3
	iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE -o
eth3
	iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE -o
eth3
	iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -j MASQUERADE -o
eth3
	iptables -t nat -A POSTROUTING -s 192.168.4.0/24 -j MASQUERADE -o
eth0
	iptables -t nat -A POSTROUTING -s 192.168.5.0/24 -j MASQUERADE -o
eth0
	iptables -t nat -A POSTROUTING -s 192.168.6.0/24 -j MASQUERADE -o
eth0
	iptables -t nat -A POSTROUTING -s 192.168.7.0/24 -j MASQUERADE -o
eth0

(The 192.168.7.0 subnet is reserved for system devices).

The default gateway for the linux box itself is 192.168.100.254, which is
the same route as the students, and so, the student rules work fine, and
they get internet perfectly well. The problem arises with conference guests;
thy do not seem to get internet access (they cannot access web pages, email,
etc), although if you try to go to a website like www.google.com, the
browser is able to determine the IP address of the website (I'm not 100%
sure if this is correct or not, and am currently not in a position to
check).

I have tried manually adding a route for each of the subnets, e.g.
	route add -net 192.168.0.0 netmask 255.255.255.0 dev eth3

But this does not seem to make any difference, even if I consequently remove
the default gateway too (the only difference that makes is that students
then lose internet access too!)

I have been advised by a friend that it could be a firewall configuration
issue, and that I need some rules to redirect incoming packets from eth3
back out on the correct interface, as at the moment they might be going from
eth3 to the default gateway. I'm not sure if this is the case, and even if
it were, I'm not sure how to construct rules to do this.

I'm sorry this is such a long post. Is anyone able to shed any light on this
situation? Any help would be *greatly* appreciated :)  If any other
information about the setup is needed, I will gladly provide it...

Many thanks,

Paul

---
Paul Lewis (paul.lewis@st-annes.ox.ac.uk)
JCR Computing Rep
St Anne's College
http://www.stannesjcr.org 





