From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to send all packets to a router
Date: Mon, 24 Feb 2003 22:11:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302242211.38647.netfilter@newkirk.us>
References: <3C792059.865B267B@acabtu.com.mx>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3C792059.865B267B@acabtu.com.mx>
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
To: Karina <kgs@acabtu.com.mx>, netfilter@lists.netfilter.org

On Sunday 24 February 2002 12:18 pm, Karina wrote:
> Hi, i have this problem..
>
> I have an iptables-box, that is the default gateway for all my
> internal addresses, after this box all the packets are sending to my
> main router. But now, I need to send one of my internal Class C to
> another router instead of the main one.
>
> I try with this line:
>
> $IPTABLES -T NAT -a PREROUTING -i eth0 -s $THISCLASS -j DNAT --to
> other.router.ip
>
> but it seems this is not working.
>
> If i setup a computer and i put as gateway directly the new router ip
> all works. But , if i setup this same comptuer and i put as gateway my
> iptables-box (all the computers have this settings) this doesn't work.
> The packets sent by my other ip addresses are going to main router as
> usual, but the other class is not going to the alternate router.
>
> Any ideas ?

Yep.  DNAT changes the destination, the FINAL destination.  Everything=20
you DNAT with this rule is sent TO the router, not THROUGH the router.

You want to work with routing instead of NAT, because you only want to=20
change the route used to reach that destination.  The Linux Advanced=20
Routing and Traffic Control Howto ( http://lartc.org/howto ) has a=20
helpful section "Routing for Multiple Uplinks" at=20
http://lartc.org/howto/lartc.rpdb.multiple-links.html that should tell=20
you what you want. =20

Basically you need to create 2 routing tables, with an upstream router as=
=20
the default route in each.  Make the 'main' router the overall default,=20
and the secondary router has a rule that sends specific traffic to it. =20
You can source-route ("Prev" from the Multiple-Uplink section linked=20
above) just with the routing configuration, or you can use the MARK=20
target in mangle PREROUTING with iptables to flag the traffic destined=20
for it, and then set up a routing rule based on the fwmark, as explained=20
in http://lartc.org/howto/lartc.netfilter.html .  From what you=20
outlined, source routing is your simplest solution, and won't directly=20
involve iptables at all.  MARK is more useful in situations where you=20
need to send specific types of traffic, rather than specific sources,=20
through a different route.

j


