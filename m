From: =?ISO-8859-1?Q?Jorge_Ner=EDn?= <jnerin@gmail.com>
Subject: Re: 2 NICs on same subnet
Date: Sat, 6 Nov 2004 00:37:52 +0100
Message-ID: <30df48470411051537e561da9@mail.gmail.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E38F@alderaan.smgtec.com>
	<20041105191621.GA17889@zion.homelinux.com>
Reply-To: =?ISO-8859-1?Q?Jorge_Ner=EDn?= <jnerin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041105191621.GA17889@zion.homelinux.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

I think your solution it's in
http://lartc.org/howto/lartc.rpdb.multiple-links.html, let me
copy&paste.

---8<------------------
                                                                 ________
                                          +------------+        /
                                          |            |       |
                            +-------------+ Provider 1 +-------
        __                  |             |            |     /
    ___/  \_         +------+-------+     +------------+    |
  _/        \__      |     if1      |                      /
 /             \     |              |                      |
| Local network -----+ Linux router |                      |     Internet
 \_           __/    |              |                      |
   \__     __/       |     if2      |                      \
      \___/          +------+-------+     +------------+    |
                            |             |            |     \
                            +-------------+ Provider 2 +-------
                                          |            |       |
                                          +------------+        \________


4.2.1. Split access

The first is how to route answers to packets coming in over a
particular provider, say Provider 1, back out again over that same
provider.

Let us first set some symbolical names. Let $IF1 be the name of the
first interface (if1 in the picture above) and $IF2 the name of the
second interface. Then let $IP1 be the IP address associated with $IF1
and $IP2 the IP address associated with $IF2. Next, let $P1 be the IP
address of the gateway at Provider 1, and $P2 the IP address of the
gateway at provider 2. Finally, let $P1_NET be the IP network $P1 is
in, and $P2_NET the IP network $P2 is in.

One creates two additional routing tables, say T1 and T2. These are
added in /etc/iproute2/rt_tables. Then you set up routing in these
tables as follows:

=09  ip route add $P1_NET dev $IF1 src $IP1 table T1
=09  ip route add default via $P1 table T1
=09  ip route add $P2_NET dev $IF2 src $IP2 table T2
=09  ip route add default via $P2 table T2
=09

Nothing spectacular, just build a route to the gateway and build a
default route via that gateway, as you would do in the case of a
single upstream provider, but put the routes in a separate table per
provider. Note that the network route suffices, as it tells you how to
find any host in that network, which includes the gateway, as
specified above.

Next you set up the main routing table. It is a good idea to route
things to the direct neighbour through the interface connected to that
neighbour. Note the `src' arguments, they make sure the right outgoing
IP address is chosen.

=09    ip route add $P1_NET dev $IF1 src $IP1
=09    ip route add $P2_NET dev $IF2 src $IP2
=09 =20

Then, your preference for default route:

=09    ip route add default via $P1
=09 =20

Next, you set up the routing rules. These actually choose what routing
table to route with. You want to make sure that you route out a given
interface if you already have the corresponding source address:

=09    ip rule add from $IP1 table T1
=09    ip rule add from $IP2 table T2
=09 =20

This set of commands makes sure all answers to traffic coming in on a
particular interface get answered from that interface.

---->8-----------------

That's all, I have tried it in exactly the same way it's depiected,
with two internet providers, and it woks ok, you have a default router
for your generated trafic, but you answer to external petitions using
the incoming interface.

I think it can be massaged to suit your case, good luck.

On Fri, 5 Nov 2004 20:16:21 +0100, Sven Schuster <schuster.sven@gmx.de> wro=
te:
>=20
> Hi Daniel,
>=20
> On Fri, Nov 05, 2004 at 10:45:45AM -0800, Daniel Chemko told us:
>=20
>=20
> > Ok, here's my two cents. There IS a solution, I can feel it. I'm just
> > going to work through it through talking, and hope for the best. (Note,
> > Although not totally in topic, the solution is in fact)
> >
> > 1. You're getting inbound responses on the wrong NIC because you're
> > sending IP requests from the wrong device. The Switch thinks that NIC 1
> > does have IP #2 (AKA: Accidental ARP poison).
> > 2. I'm assuming you're using this for either an extra security mechanis=
m
> > or for a backup line
> > 3. I'm assuming that the machine is standalone and is not hosting
> > services behind it. Lets just throw that complexity out the window.
> >
> > So, the real thing you need to do is FORCE packets to/from IP1 in/out o=
f
> > IF1 and packets to/from IP2 in/out of IF2.
> >
>=20
> thanks for your and everybody's else's tipps and discussion on this topic=
,
> I already wanted to try the iproute2 based solution today but didn't have
> enough time to do this. I'll try tomorrow and come back here and tell you
> about my success (or not :-).
> But I also think about going to my boss and tell him that this whole idea
> is crap as we won't be able to handle more input no matter if it comes in
> from one interface or two...I think the best solution would be to let the
> second NIC stay down until the moment the first one won't work any more.
>=20
> Once again, thanks to everybody!!!
>=20
> Sven
>=20
> --
> Linux zion 2.6.9-rc1-mm4 #1 Tue Sep 7 12:57:19 CEST 2004 i686 athlon i386=
 GNU/Linux
>  20:09:17 up 1 day, 23:37,  1 user,  load average: 0.03, 0.05, 0.01
>=20
>=20
>=20


--=20
Jorge Ner=EDn
<jnerin@gmail.com>

