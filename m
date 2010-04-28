From: Eric Leblond <eleblond@edenwall.com>
Subject: Re: Polling for conntrack events
Date: Wed, 28 Apr 2010 10:03:17 +0200
Message-ID: <1272441797.29439.14.camel@khasse.inl.fr>
References: <201004261120.55513.morgon.j.kanter@dartmouth.edu>
	 <4BD728DA.1010004@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-w/EuRlFe8xOvK2l82jmW"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD728DA.1010004@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Cc: netfilter@vger.kernel.org


--=-w/EuRlFe8xOvK2l82jmW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 avril 2010 =C3=A0 20:11 +0200, Pablo Neira Ayuso a =C3=A9crit :
> Morgon J. Kanter wrote:
> > Hi,
> >=20
> > I'm developing an application that uses libnetfilter_conntrack to note =
when=20
> > connections start and end as part of what it does. So far I've been abl=
e to do=20
> > just fine is use nfct_filter with nfct_catch and have a function called=
=20
> > whenever the appropriately filtered conntrack events happen. This works=
 well,=20
> > but my program doesn't *just* look for conntrack events and act on them=
. To=20
> > keep it single-threaded what I'd like to do is just be able to poll for=
=20
> > conntrack events, with poll() or select() or whatever.
>=20
> IRC, you can use nfct_fd() to get the netlink file descriptor.
>=20
> > What I attempted was extracting the netlink fd with the filter applied,=
 and=20
> > running select() on a set containing just that, and then using nfct_que=
ry().
>=20
> nfct_query() is not of any use to listen to events.
>=20
> > This didn't work at all though -- when filtered conntrack events do hap=
pen,=20
> > apparently nothing is pushed down that file descriptor. Is there any wa=
y to do=20
> > what I want? I didn't see anything that was using this sort of function=
ality=20
> > in the utils directory.
>=20
> You can look at the conntrack-tools, specifically conntrackd, it does=20
> more or less what you seem to need.

Or have a look at ulogd2 NFCT input plugin. By the way, ulogd2 may be a
good starting point for your application...

See the following url for the code:
http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dulogd2.git;a=3Dblob;f=3Dinp=
ut/flow/ulogd_inpflow_NFCT.c

BR,
--=20
=C3=89ric Leblond, eleblond@edenwall.com
T=C3=A9l=C3=A9phone : +33 1 40 24 65 04, Fax : +33 9 57 21 48 75
EdenWall, http://www.edenwall.com

--=-w/EuRlFe8xOvK2l82jmW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkvX68MACgkQnxA7CdMWjzLoSQCcCROL6rzJPMff3w1uhLad6K/5
B7IAnRNZh1JBrGUQzGQjki90Pqzmmx/U
=X3tA
-----END PGP SIGNATURE-----

--=-w/EuRlFe8xOvK2l82jmW--

