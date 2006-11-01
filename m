From: Eric Leblond <eric@inl.fr>
Subject: Re: cooperation between connection tracking and traffic shaping
Date: Wed, 01 Nov 2006 11:45:18 +0100
Message-ID: <1162377918.18395.13.camel@localhost>
References: <f36b08ee0611010211r598a4857u383de5d0c721887a@mail.gmail.com>
	<9151ac2a0611010221i3e062172pc9c6ee5e636b94b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Av54sNJTm116BH3m3s/3"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9151ac2a0611010221i3e062172pc9c6ee5e636b94b3@mail.gmail.com>
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
To: Filip Sneppe <filip.sneppe@gmail.com>
Cc: netfilter@lists.netfilter.org


--=-Av54sNJTm116BH3m3s/3
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 01 novembre 2006 =E0 11:21 +0100, Filip Sneppe a =E9crit :
> Hi Yakov,
>=20
> On 11/1/06, Yakov Lerner <iler.ml@gmail.com> wrote:
> > It worked. But I think it was ugly because:
> >     (2) maybe there is a much easier way to achieve this
> > qos-to-conntrack cooperation [than hacking conntrack modules] ?
> >
> Yes, the general way to do this, is to use the MARK target from
> netfilter to mark the packets you want to QoS and then use the fwmark
> from within your tc rules.
>=20
> That works without hacking any code. Note that the fwmarks can also
> be used between netfilter and the advanced routing framework in the
> Linux kernel (ip route, ip rule, etc.)

Yes, but you have to use CONNMARK on top of that to be able to put the
mark on all packets of a connections. It also works with RELATED
packets. This will be useful with SIP ...

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-Av54sNJTm116BH3m3s/3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFSHq+nxA7CdMWjzIRAuDnAJ0b4zCAUVvMlxzir02tsy6uX0KjDgCgi+zg
Pa6SxvXVT8ynSiRQRG/mNtk=
=ZfFU
-----END PGP SIGNATURE-----

--=-Av54sNJTm116BH3m3s/3--


