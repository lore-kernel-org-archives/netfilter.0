From: Harald Welte <laforge@netfilter.org>
Subject: Re: dstlimit
Date: Wed, 20 Oct 2004 08:29:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020062931.GS21927@sunbeam.de.gnumonks.org>
References: <Pine.SUN.4.58.0410191746080.22855@eskimo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UkokfXldvRlmz8/+"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.SUN.4.58.0410191746080.22855@eskimo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jerome Ibanes <jibanes@eskimo.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--UkokfXldvRlmz8/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2004 at 05:48:17PM -0700, Jerome Ibanes wrote:
>=20
> I'm trying to setup dstlimit, but, for instance, such configuration:
> root@erinyes:/usr/src/linux# /usr/local/sbin/iptables -A INPUT -m dstlimit
> --dstlimit 1000 --dstlimit-burst 10000 --dstlimit-htable-size 100000
> --dstlimit-htable-max 1000000 --dstlimit-htable-expire 100000
> --dstlimit-htable-gcinterval 1000 --dstlimit-mode dstip-dstport
> --dstlimit-name foo -j REJECT
>=20
> rejects each and every packet, do you know what could possibly be wrong? I
> use 2.6.9, iptables 1.2.11 on a slackware 10.
>=20
> Do you have any examples of dstlimit configurations?

It behaves exactly like 'limit'.  It matches underlimit packets and
doesn't match overlimit packes.  Your rule therefore does exactly what
it is intended: REJECT any underlimit (i.e. within-the-limit) packets.

A patch to the netfilter-extensions-HOWTO is appreciated.

> Thanks,
> Jerome

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--UkokfXldvRlmz8/+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBdgXLXaXGVTD0i/8RApWeAJ4xh+8bmgUeDnhUd0fECvDUM+1hSQCeJDq9
PWJmnRN+e1/tgJPVkio7KPk=
=QsLK
-----END PGP SIGNATURE-----

--UkokfXldvRlmz8/+--

