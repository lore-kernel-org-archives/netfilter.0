From: Andrew Pilley <ashridah@bordernet.com.au>
Subject: Interesting SNAT setup quesiton
Date: Mon, 25 Nov 2002 12:24:56 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125012456.GB766@bordernet.com.au>
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
To: netfilter@lists.netfilter.org

Hi, i've got a small problem that i'm trying to clarify:

We currently have access to a small satellite range of ip addresses,
that are routed via the satellite for incoming data only (outgoing
packets must leave via conventional means). This basically yields an
assymetric route, that leaves via isdn, and comes back in via satellite.


My problem is this: We have an internal office network, a DMZ (with a
machine that has the satellite card) and a DSL connection (as well as
the isdn connection), thus: (bad ascii art warning alert)


| SAT | internet (incoming)
\-----/                                         adsl-internet
   |              internet (outgoing)             | ppp0
-------             |                          --------
|linux|          ---------                eth1 |linux |
| sat |          | isdn r|              -------| ADSL |
-------          ---------              |      --------
   |                 |    DMZ network   |         |eth0
   --------------------------------------         |
                                              internal office

basically, what i'm looking at acheiving, is 

$IPT -t nat -A POSTROUTING -o $ETH_EXT --src $NET_INT --dst $NET_EXT -j SNAT --to-source $IP_SNAT_SAT


where $NET_INT is the ip address range in the internal office, NET_EXT
is 0/0 (effectively), ETH_EXT is the adsl interface (ppp0 in this
case), and IP_SNAT_SAT is an ip address that gets routed IN through the
satellite, and sent to eth1, connected to the DMZ. 

the SNAT is being done by the linux ADSL machine, running a 2.4.18
kernel with netfilter.

when i try to do this, it appears that the linux netfilter box NATs the
packet properly when going out ppp0, but doesn't recognise the packet
as part of an existing connection when it comes back in via eth1. the
NAT box definently should be seeing packets going both ways (it's the
only route into the internal network) and i can ssh TO the linux adsl
router using it's assigned satellite address without any problems
so i know the adsl network is forwarding the satellite-sourced packets.

if i SNAT it with an ip address that goes bothways over the ADSL link
(still an ip on eth1 however), then it works fine.

basically, i'm asking: is assymetrical routing possible when natting the
internal network, or am i going to have to bite the bullet, and use an
extra machine to protect the internal network and provide NAT (which, as
i'm well aware, is a better solution, but it's one extra machine for me
to manage at this time). 

if theres a modification i can make to my ruleset to make it work
properly (or a sysctl to set, i've tried turning off spoofing
protection, to no avail) i'll be reasonably happy.


Thanks 

Andrew Pilley



