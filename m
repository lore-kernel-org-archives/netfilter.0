From: Eric Leblond <eric@inl.fr>
Subject: Re: Recurring ip_conntrack table overflow
Date: Wed, 11 Oct 2006 23:04:50 +0200
Message-ID: <1160600690.24065.1.camel@localhost>
References: <F1B471B6CE5CFA458DFED6C7669D039706C21D3B@usplm234.amer.corp.eds.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-SF7m3FV7XUHiHo1di4RE"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F1B471B6CE5CFA458DFED6C7669D039706C21D3B@usplm234.amer.corp.eds.com>
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
To: "Wilson, Richard E" <richard.wilson@eds.com>
Cc: netfilter@lists.netfilter.org


--=-SF7m3FV7XUHiHo1di4RE
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Le mercredi 11 octobre 2006 =E0 15:39 -0500, Wilson, Richard E a =E9crit :
> All,
>=20
> I have a server that is frequently running out of slots in the
> ip_conntrack table and have been trying to determine how best to handle
> it.  The ip_contrack_max sysctl parm is set to 65536 already (this
> server has 4GB of RAM) and the ip_conntrack slot count (determined by
> "cat /proc/net/ip_conntrack | wc -l") is both growing and decreasing.
> Apparently a "clean" disconnect frees a slot.
>=20
> The server had to be rebooted this AM as the console was displaying a
> series of messages:
>=20
> ip_conntrack: table full, dropping packet
>=20
> After some research, I'd like to find out what my options are:
>=20
> 1. Can the ip_contrack_max parm be set higher than 65536?  Is it
> desirable (how much RAM does each slot take)?

I recommend this reading this is really informative :
	http://www.wallfire.org/misc/netfilter_conntrack_perf.txt
This documents the way you can *greatly* improve the conntrack
behaviour.

BR,

>=20
> 2. I found a reference to a timeout value in Linuxquestions.org:=20
>=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
>=20
> This appears to be the amount of time to keep an entry in the conntrack
> table, and defaults to 6 days... This parm doesn't exist on my server
> (running RH EL 3.2.3-54, kernel 2.4.21-47 and iptables 1.2.8)   What
> would be involved in upgrading iptables to include this parm and would
> decreasing it to 1 or 2 days address the issue?
>=20
> 3. I also found a reference to a "NOTRACK" target that appears to make
> packets to which it applies not get put into the conntrack table.  Could
> this be used to handle my loopback traffic?  I currently have an ACCEPT
> rule for any traffic on the loopback (127.0.0.1) and out of 17,485
> entries currently in my conntrack table, 6,216 have source and
> destination of 127.0.0.1 -- getting these out of the table would really
> help.  (I have verified that this is legitimate traffic for this server)
>=20
> Where can I find more information out about the NOTRACK target and how
> is it implemented (does NOTRACK DROP, REJECT or ACCEPT packets)?
>=20
> Thanks in advance,
>=20
>=20
> Richard Wilson
> Richard dot wilson at eds dot com
>=20
--=20
Eric Leblond <eric@inl.fr>
INL

--=-SF7m3FV7XUHiHo1di4RE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBFLVxynxA7CdMWjzIRAlCJAJ9LUgarQww/gtAWVI41/FurMPeOXACdGAQ+
e1UnGOX0UHv8MRvQ0ztHODo=
=Y9fn
-----END PGP SIGNATURE-----

--=-SF7m3FV7XUHiHo1di4RE--


