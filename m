From: Paul Evans <paul@mxtelecom.com>
Subject: Automatic DNAT+SNAT fixup
Date: Wed, 4 Nov 2009 14:24:11 +0000
Message-ID: <20091104142411.04aff20f@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/iTNg9JVNhs07=YRWVc26B=9"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/iTNg9JVNhs07=YRWVc26B=9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

We have a lot of DNAT rules in place on a shared cluster of routers,
to direct traffic to virtual "role IPs" to specific backend machines
to handle them. In order to ensure that the replies come to the right
router, we then SNAT as well.

This results in rules like the following:

  for IP in (lots of role IPs); do
    iptables -A POSTROUTING -m conntrack --ctstate DNAT --ctorigdest $IP \
      -j SNAT --to-source $IP
  done

I wonder if, instead of doing that, it might be possible to create a
single target, perhaps called FIXNAT, which applies the obvious logic.
It could be used something like

  iptables -A POSTROUTING -m conntrack --ctstate DNAT -j FIXNAT

and would apply an SNAT to whatever source address the original
destination was.

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/iTNg9JVNhs07=YRWVc26B=9
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrxjosACgkQcGehlx3Gqx7z1gCeJY1o6/rpE5/PLU2USropyAc6
/FUAoJnRUh5PHWmtPV2nAfLdeXbvvz6B
=KGiX
-----END PGP SIGNATURE-----

--Sig_/iTNg9JVNhs07=YRWVc26B=9--
