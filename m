From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Gigabit
Date: Tue, 9 Mar 2004 15:08:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F302856A8F@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

In my initial testing with netfilter, I found it started dropping =
packets eventually. But it tries really hard to keep up before that. At =
around 50% utilization on a 100meg pipe I started seeing packet loss =
with random syn packets (basically just sending syn requests using =
random source/destination ports at a firewall with no ruleset). CPU =
utilization at that point was maxed out.=20

Brian

-----Original Message-----
From: bmcdowell@coxhealthplans.com [mailto:bmcdowell@coxhealthplans.com]
Sent: Tuesday, March 09, 2004 15:01
To: netfilter@lists.netfilter.org
Subject: RE: Gigabit



Anthony makes a good point.  'Need' is probably going to be the biggest =
factor here.  For example, what exactly does gigabit to the VPN net you? =
 If it's intended that internet users be the ones who use the VPN to =
access the subnets, how many concurrent users would saturate your =
internet pipe?  My guess is that this would happen far sooner than would =
your over running the bandwidth that 100mbps can get you.  It does =
depend on the size of your internet pipe, but it would have to be pretty =
broad.

Now, one could make a case for gigabit from subnet1 to subnet2.  In this =
situation, however, maybe a nice managed Cisco switch would suit your =
needs a little better than a netfilter firewall?  No offense to anyone =
is intended, and it may not even be applicable, but it's my two-cents =
anyway.

---

All that being said, what happens to packets when netfilter is =
over-tasked?  Are they dropped?  Lost?  Ignored?  Routed?  I'm sure this =
has been asked here before, but I don't remember the answer...


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Tuesday, March 09, 2004 2:45 PM
To: netfilter@lists.netfilter.org
Subject: Re: Gigabit


On Tuesday 09 March 2004 8:05 pm, Vladimir Potapov wrote:

> 1)I want to use this network scheme:
>
>       subnet-1 --------
>                        | PF | --------Firewall------cisco ----- =
Internet
>       subnet-2 --------                           |
>                                              VPN-server
>
> PF and Firewall - box'es with iptables . Does they need to have PPTP
> support to route traffic?

The simple answer to this is "no, they do not need PPTP support in order =
to=20
route traffic".   However, bits of information which are not obvious =
from the=20
above description means that the answer might need to be "yes".

1. What does PF do?   To me, PF means Packet Filter, in which case, =
what's the=20
difference between that and "Firewall"?

2. Is there any NAT involved (this is the biggest reason why you might =
need=20
explicit PPTP support in the boxes shown above)?

3. You have shown where the PPTP server is (one endpoint of the VPN/s), =
but=20
where are the clients (the other end/s)?   If they are on the Internet, =
then=20
no VPN (presumably PPTP) traffic is going through PF and Firewall, =
therefore=20
they don't need to bother about it.   If the clients are on the =
subnets-1/2,=20
then maybe PF and Firewall do need to bother about the VPN traffic.

> 2)At all I have 7 subnets with a lot of traffic.6 subnets with users =
(in
> 50-400 users in each subnet) and 1 for server with web board, chat and
> news.

What are the bandwidths of the connections for each subnet, and the =
Internet=20
link?

> Does anyone use iptables in gigabit network? How big nominally a =
throughput
> of gigabit network with filtering by iptables ?

That depends on things like: the hardware of the firewall machine (CPU =
speed,=20
memory size), and very much on the number of rules you have in your =
ruleset.

Tell us a bit more information, and hopefully we'll be able to help a =
bit more=20
with some suggestions.

Regards,

Antony.

--=20
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

