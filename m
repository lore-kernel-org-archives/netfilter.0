From: Damian Gatabria <damian_g@speedy.com.ar>
Subject: Re: iptables dnat to loopback
Date: Mon, 09 Aug 2004 11:40:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092062432.7056.3.camel@localhost>
References: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
 <1091945878.12669.0.camel@localhost> <200408080941.38256.lists@edeca.net>
 <200408081350.12149.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200408081350.12149.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Lista Netfilter <netfilter@lists.netfilter.org>

El dom, 08-08-2004 a las 13:50 -0400, Alistair Tonner escribi=C3=B3:
> On August 8, 2004 04:41 am, David Cannings wrote:
> > On Sunday 08 August 2004 07:17, Damian atabria wrote:
> > > :o( no luck.
> > >
> > > I even tried -F ing INPUT, FORWARD, OUTPUT, PREROUTING and POST=
ROUTING
> > > before adding the rule, (all policies set to ACCEPT) and still =
no luck!
> > > Forwarding is enabled,
> > > net.ipv4.conf.all.forwarding =3D 1
> > > net.ipv4.ip_forward =3D 1
> > > and still the packets are going nowhere... however giving
> > > the loopback an alias with an ip address of, say, 200.136.136.1=
36
> > > works... so why can't I route to 127.0.0.x? Is there anything
> > > else I should check/add?
> >
> > You can't send packets from non 127/8 addresses to 127/8.  The ke=
rnel
> > filters them out and drops them as it considers them "martians".
> >
> > David
>=20
> =09Okay ---=20
> =09   If I'm following this thread correctly then,=20
> =09
> =09we need two rules to manage this ... both Destination and Source=
 Natting=20
> these packets ...=20
> =09My question is .....=20
> =09As I understand things DNAT is done in PREROUTING and SNAT is do=
ne in=20
> POSTROUTING ..=20
>=20
> =09I can setup=20
> =09
> =09iptables -I PREROUTING -t nat -p TCP -s 192.168.0.2 -d 10.1.105.=
45 --dport \=20
> 3306 -j DNAT --to 127.0.0.1
> and (since nat postrouting FOLLOWS nat prerouting)=20
> =09iptables -I POSTROUTING -t nat -p TCP -s 192.168.0.2 -d 127.0.0.=
1 --dport \=20
> 3306 -j SNAT --to 127.0.0.1
>=20
> =09But I don't belive that this will solve the above problem of the=
 /drop=20
> martians/ behaviour.
>=20
> =09Any comments folks?
>=20
> =09Alistair Tonner

I'll try this when i get home, on my frankenstein box. I'll post
back later today.

Thank you all who replied.



--=20
Damian Gatabria <damian_g@speedy.com.ar>



