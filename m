From: Jason Opperisano <opie@817west.com>
Subject: Re: Accessing physical subnets with same address range via a
	single gateway
Date: Fri, 12 Nov 2004 11:08:19 -0500
Message-ID: <1100275699.3534.36.camel@hubcap.ljm.dom>
References: <1C888AFC989D0E45BA0417091408E23199E897@saturne.volubill.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1C888AFC989D0E45BA0417091408E23199E897@saturne.volubill.com>
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

On Fri, 2004-11-12 at 05:04, CARRY Gilles wrote:
> I need to access several equipments through a single gateway. These
> equipments have the same address range (172.16.32.0/24) which cannot be
> modified.

> Here is a diagram worth a thousand words:
>  
>                      gateway
> 
> (general network:GN) - eth0
> 
>                        eth1  ---- (equipments A: subnet= 172.16.32.0/24)
> 
>                        eth2  ---- (equipments B: subnet= 172.16.32.0/24)
> 
>                        eth3  ---- (equipments C: subnet= 172.16.32.0/24)

> My idea is to NAT all these subnets from the general network. Equipment
> A would be accessible from GN using its nonNATed subnets (172.16.32.x
> ...) Equipment B would be accessible from GN using NATed adrresses
> (172.20.32.x-> 172.16.32.x)
> 
> Equipment C would be accessible from GN using NATed adrresses
> (172.24.32.x-> 172.16.32.x)
>  
> So I need to NAT each whole subnet toward a specific interface.
> 
> The problem here is twofold: routing and NATing to physical subnets that
> have the same address range and attached to a single machine. 
> 
> Before trying with several equipments, I tried to setup a single subnet
> with only one server acting as equipment B having the range:
> 172.16.32.0/24.
> 
> On the gateway:
> 
>       ifconfig eth2 172.16.32.100/24 up
> 
>       ifconfig eth2:1 172.20.32.100/24 up

i'm not sure why you are creating an interface on the gateway for the
172.20.32.0/24 network, as this will be on of your NAT-ed ranges, and
this step causes the failure a few steps later...

> On the B equipment:
> 
>       Ifconfig eth0 172.16.32.10/24 up
> 
> So I get this:
> 
>                      gateway
> 
> (general network:GN) - eth0
> 
>                        eth2   (172.16.32.100) ---- (equipment B=
> 172.16.32.10)
> 
>                        eth2:1 (172.20.32.100)
> 
>  
> 
> ping 172.16.32.10 works.
> 
> ping 172.20.32.10 does not work (as expected!)
> 
> Now I tried to setup NAT on the gateway:
> 
> iptables -t nat -A POSTROUTING -d 172.20.32.0/24 -j NETMAP --to
> 172.16.32.0/24
> 
> I expected that pinging 172.20.32.10 from the gateway would route the
> packets to eth1:1, NETMAP them as 172.16.32.10 and send them on the
> wire. Unfortunately it does not work. A tcpdump from equipment B says
> that 172.16.32.100 is broadcasting arp request: "who has 172.20.32.10?",
> meaning that the POSTROUTING NAT didn't work.

because you told gateway that it has an interface on that network which
doesn't exist.

> Any clue?

lemme see if i can step-by-step this for you...

start out configuring the interfaces on the gateway--i'm going to assume
that the general network is 10.1.1.0/24, and that the gateway is .1 on
all segments:

# flush all IP addresses so we're starting fresh:
ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3

# add IP's to each interface
ip addr add 10.1.1.1/24 brd + dev eth0
ip addr add 172.16.32.1/24 brd + dev eth1
ip addr add 172.16.32.1/24 brd + dev eth2
ip addr add 172.16.32.1/24 brd + dev eth3

now--do a:
  ip route list

and make sure you have the 10.1.1.0/24 network routed out via eth0:

  10.1.1.0/24 dev eth0  proto kernel  scope link  src 10.1.1.1

and you have the 172.16.32.0/24 network routed out via eth1:

  172.16.32.0/24 dev eth1  proto kernel  scope link  src 172.16.32.1

at this point--you should be able to get to 172.16.32.0/24 from the
general network (10.1.1.0/24 in my example) like you were before.  now
we need to setup the NAT and routing for the two duplicate
172.16.32.0/24 networks:

the NAT part is pretty straight-forward.  you were right on with the
NETMAP idea (just missed a bit in the execution--DNAT needs to be
performed PREROUTING, not POSTROUTING):

  iptables -A PREROUTING -i eth0 -d 172.20.32.0/24 \
    -j NETMAP --to 172.16.32.0/24

  iptables -A PREROUTING -i eth0 -d 172.24.32.0/24 \
    -j NETMAP --to 172.16.32.0/24

NOTE:  you need to make sure that packets destined for 172.20.32.0/24
and 172.24.32.0/24 are routed to this gateway (i think you already have
this working though).

now we need to setup routing to make sure the packets that were destined
for 172.20.32.0/24 are routed out eth2, and 172.24.32.0/24 are routed
out eth3.  we will do this with iptables MARK-ing, and a couple of
iproute2 alternate routing tables:

  # mark the eth2 duplicate net with 2
  iptables -t mangle -A PREROUTING -i eth0 -d 172.20.32.0/24 \
    -j MARK --set-mark 2

  # mark the eth3 duplicate net with 3
  iptables -t mangle -A PREROUTING -i eth0 -d 172.24.32.0/24 \
    -j MARK --set-mark 3

setting up the alternate routing tables:

  echo 200 dup2 >> /etc/iproute2/rt_tables
  echo 300 dup3 >> /etc/iproute2/rt_tables

add ip rules to lookup routes from the alternate tables for marked
packets:

  ip rule add fwmark 2 table dup2
  ip rule add fwmark 3 table dup3

finally--add the local network routes for 172.16.32.0/24 into the
alternate routing tables:

  ip route add 172.16.32.0/24 dev eth2 table dup2
  ip route add 172.16.32.0/24 dev eth3 table dup3

after we setup this type of alternate routing, it's always a good idea
to flush our route cache to make sure we're using what we think we're
using:

  ip route flush cache

that should cover allowing 10.1.1.0/24 to initiate connections to the 3
172.16.32.0/24 networks.  if the 3 172.16.32.0/24 networks need to
initiate connections to the 10.1.1.0/24 network, this example can be
expanded (MARK packets PREROUTING on eth2 and eth2, and NETMAP
POSTROUTING on eth0 based on that MARK)...but i think that will be for
another post.

HTH...

-j

--
"Oh, people can come up with statistics to prove anything, Kent. 14%
 of people know that."
	--The Simpsons


