From: "David C. Hart" <dch@TQMcube.com>
Subject: ICMP Rule Problem
Date: Mon, 02 Feb 2004 12:02:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075741362.3714.25.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7V5OYaAULzBdZKgBRKoM"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-7V5OYaAULzBdZKgBRKoM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Should this not reject echo requests?

-A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
icmp-net-prohibited

It doesn't seem to work.

                               ---------
            Quality Management - A Commitment to Excellence

--=-7V5OYaAULzBdZKgBRKoM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAHoKyol4OE0cpGaIRAkp/AJ9fn6QPu8SI0qHhXmuwTeGsmJ4VsACglGnd
HQaZ0SvVD/ZUjfRzuABvHqM=
=DtUX
-----END PGP SIGNATURE-----

--=-7V5OYaAULzBdZKgBRKoM--


