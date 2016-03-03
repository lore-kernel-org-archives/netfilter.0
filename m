From: Karol Babioch <karol@babioch.de>
Subject: nftables: DNAT state in connection tracking?
Date: Thu, 3 Mar 2016 12:04:11 +0100
Message-ID: <56D81A2B.2010704@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m2VsD14dlE7WxTxR1pqxLrKQeFRfewNrd"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m2VsD14dlE7WxTxR1pqxLrKQeFRfewNrd
Content-Type: multipart/mixed; boundary="naBgT9IF8lj3284eA0Hr2kqNu5VO45Wbe"
From: Karol Babioch <karol@babioch.de>
To: netfilter@vger.kernel.org
Message-ID: <56D81A2B.2010704@babioch.de>
Subject: nftables: DNAT state in connection tracking?

--naBgT9IF8lj3284eA0Hr2kqNu5VO45Wbe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

in my old iptables setup I've used something like this in the FORWARD
chain to allow traffic that has been redirected through DNAT beforehand
(i.e. in the NAT PREROUTING table).

iptables -A FORWARD -m conntrack --ctstate DNAT -j ACCEPT

This way I don't have to specify rules twice, which is not only a
massive overhead, but also prone to errors. Apparently nftables does not
know anything about the "DNAT" and "SNAT" states.

Is there a way to simulate something like this? Marking all packages
that are redirected using DNAT in the nat table, and allowing all marked
packages through in the forwarding chain, should work, shouldn't it? Is
this in any way different to the iptables approach?

Thanks!

Best regards,
Karol Babioch


--naBgT9IF8lj3284eA0Hr2kqNu5VO45Wbe--

--m2VsD14dlE7WxTxR1pqxLrKQeFRfewNrd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW2BosAAoJEHSaZc1HnzIVOSsQAINv2pNOS1SRJ6Yw5BK6d5ZM
T3xzFnAiNw7cTGxYJ/2L6AIezixysS9PDk6ywnpS4ekPtGmRmYg+isB+AX0Xa/xQ
nprBhFW8+vvfhlHdj26XtKaRFqmKgrLTB1LpU8Zf+eTHYof34UkmPdHQMlKlmPry
m2dLQP8mN+pneEuNZLdLd+C+k46c4pFp3pDcDzoY2GEuYf4iBUXbtbP9sRQHwDtM
E/iAivNTij6tR+R8wLz2bNsccYJFfxQ+DGN6bSwK+XmWCnpe2nPPZewOsxL+cGaW
ZhZsNOTpDAL9kl2QBX9nLP73eHiSoOLrqAmr7tMG78mjdizQh4/9gRr0zotxwNp2
VNnLy4iMAoNgb2Sv66KLHs3eM0COEgiB6fq3LwwEU992gU4K767oOSK19yfN5Tt0
DxGWkXQjGNlBgDhrf08eQMHeY1dThlrCOhtUELYwsOSa9z38LVXFpUFct1Y6NtID
IBPm188N2ELHafVAV5ijXlMmRbgvk5Z6hQ2s7pN2HuwSK6K6nr0ws4tfwRT6Hp+i
DhlEuIg7+64ZOms+TC4y/OSopYWE5ULDSlFhhkPnueKm19+HtK3FryT5AGhaHZgi
FnRPtOCHXDhMNvctKct7/yGaOGQcw4Fa6necXbCyqlc72nXWJANKZmOxJlqa2p0P
vVKo6/t9HUQ7iXTDKoH1
=rhcD
-----END PGP SIGNATURE-----

--m2VsD14dlE7WxTxR1pqxLrKQeFRfewNrd--
