From: Martin Forest <martin@heimdalls.co.nz>
Subject: iptables sync?
Date: 17 Oct 2002 06:26:22 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034789188.1115.26.camel@mf.forest.gen.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-4jlrRg0GLvqY2v2Jx/cL"
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
To: Netfilter <netfilter@lists.netfilter.org>


--=-4jlrRg0GLvqY2v2Jx/cL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm sorry if I'm writing to the wrong media but I think I have looked
everywhere for my answer.
I'm the developer behind Bifrost (http://bifrost.heimdalls.com), a gui
frontend for iptables. I have just released high availability for
Bifrost/iptables. The problem I have is that I would like to sync the
two firewalls session/connection tables. I.e. to make it work in a
similar way as a checkpoint cluster would do.

What I'm looking for is a way to send all new established/terminated
connections on one firewall to the other and vise versa.
Is there a way today or is it something I/some one else would have to
write?

Martin Forest
Heimdall's Limited
New Zealand



--=-4jlrRg0GLvqY2v2Jx/cL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9raE+O+aseNmCTlcRAip/AJ0dHTTfQqC41ffuMHwX89h38AjzwACgmeLs
Yqidv65dkdxv3RTlw8cKdwU=
=7Tiq
-----END PGP SIGNATURE-----

--=-4jlrRg0GLvqY2v2Jx/cL--


