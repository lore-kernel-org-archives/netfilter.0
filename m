From: "David C. Hart" <dch@TQMcube.com>
Subject: Is there a simple way to let Whois through?
Date: Thu, 13 Nov 2003 14:39:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068752343.3536.92.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GTobb9QmBY+qErv+EG77"
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


--=-GTobb9QmBY+qErv+EG77
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I could force rwhois but I don't think that's a supported netfilter
protocol. I have some of the individual servers configured for accept. I
thought about accepting source port 43 but not all of the whois servers
use that port.

Any ideas?
                               ---------
            Quality Management - A Commitment to Excellence

--=-GTobb9QmBY+qErv+EG77
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/s93Xol4OE0cpGaIRAg7KAKCHZNgxFScWXzZfSPGSO0A1x5VSugCbB1D3
kpdtcsAJI3BBHH036GtwIEg=
=iXNs
-----END PGP SIGNATURE-----

--=-GTobb9QmBY+qErv+EG77--


