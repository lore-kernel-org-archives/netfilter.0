From: "Joao Alberto M. dos Reis" <joao@afreis.com.br>
Subject: Re: choosing the output gateway
Date: Thu, 29 Jul 2004 20:30:55 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091143855.23215.54.camel@goku.afreis.com.br>
References: <1091140143.23217.29.camel@goku.afreis.com.br>
	 <200407292339.26158.Antony@Soft-Solutions.co.uk>
	 <1091141434.23223.31.camel@goku.afreis.com.br>
	 <200407292357.17665.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0LRiLENVEjwqnEfaAT9r"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407292357.17665.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-0LRiLENVEjwqnEfaAT9r
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Well, the ideia is make an ip load balancing with 3 links (no need to be
perfect, we can lose some time for the route cache)
I dont know if there is a way to make it, but...

2 of then (200.213.48.24 and 200.213.48.26) have the same gateway
(200.213.48.1)
the second (will be the redundant) has IP 200.102.250.114 with gateway
200.102.250.113

The first 2 ips need to portforward some ports to different machines,
like 200.213.48.24:25 goes to 192.168.0.3:25 and 200.213.48.26:80 goes
to 192.168.0.4:80 (here i don't know if it will be a problem having the
same gateway ip)

The third link have to portforward all services inside the network like
25 and 80.

The ideia is OR making a load balance OR adding 2 ips to the DNS.

(I really dont know if it is possible... if you have any sugestions I
would apreciate)
--------

I'm going in parts, so first I have 2 links with different gateways and
the other link is down.


 so I have this:

ip route add 200.213.48.24 via 200.213.48.1 table T1
ip route add 200.102.250.114 via 200.102.250.113 table T2

ip rule add from 200.213.48.24 table T1
ip rule add from 200.102.250.114 table T2

ip route add default via 200.102.250.113 table T2

* The 200.213.48.24 gw is default (route add default gw 200.213.48.1)

In iptables I have this:

iptables -t nat -A PREROUTING -p tcp -d 200.213.48.24 --dport 25 -j DNAT
--to 192.168.0.3:25
AND
iptables -t nat -A PREROUTING -p tcp -d 200.102.250.114 --dport 25 -j
DNAT --to 192.168.0.3:25

the route goes to the default gateway(200.213.48.1) as espected.

I was thinking in a "ifping like" script to handle this problem, who
knows?...

TIA,
Joao Reis.=20



On Thu, 2004-07-29 at 19:57, Antony Stone wrote:
> On Thursday 29 July 2004 11:50 pm, Joao Alberto M. dos Reis wrote:
>=20
> > yep
>=20
> Okay, show us your rules and the routing tables.
>=20
> Regards,
>=20
> Antony
>=20
> > On Thu, 2004-07-29 at 19:39, Antony Stone wrote:
> > > On Thursday 29 July 2004 11:29 pm, Joao Alberto M. dos Reis wrote:
> > > > Hi,
> > > >
> > > > I have the following:
> > > > 1 linux box with 2 valid IPs with different gateways each.
> > > >
> > > > I need to port forward different ports inside my network to differe=
nt
> > > > machines.
> > > >
> > > > I have set a default gateway to the first link and created a routin=
g
> > > > table for the second link pointing to the second gateway. but when =
I
> > > > make my portforward to this second link, the packets try to leave b=
y
> > > > the first gateway.
> > > >
> > > > How can I fix that?
> > >
> > > Did you use iproute2 rules for this?
> > >
> > > http://lartc.org
> > >
> > > Regards,
> > >
> > > Antony.

--=-0LRiLENVEjwqnEfaAT9r
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCYivcfDZuH0KEiERAnX4AKCI3K/aQZgHj+sy6lB9SNL9X7joHwCdFlkA
ZN3OPpEZqxi+GuOOnsz7E5I=
=xYAu
-----END PGP SIGNATURE-----

--=-0LRiLENVEjwqnEfaAT9r--


