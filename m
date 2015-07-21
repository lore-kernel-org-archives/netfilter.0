From: Thomas Delrue <thomas.delrue@fundamental-software.net>
Subject: Creating, editing, removing rules from C(++)
Date: Tue, 21 Jul 2015 17:41:26 -0400
Message-ID: <55AEBC86.5010604@fundamental-software.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="maPbx7OHBSpGd0RigO2TrJF9xDTqn915T"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--maPbx7OHBSpGd0RigO2TrJF9xDTqn915T
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Is there a way to interact with the firewall rules from a C(++) program?
What I'm really trying to do is have a program that only allows a
certain set of CIDRs through the firewall through a particular port.
However these CIDRs change from time to time and so my application is
there to update the firewall rules to make sure that the firewall rules
contain the latest and greatest information that says: "drop everything
trying to connect to port P EXCEPT for stuff originating from these CIDRs=
".

The information I've found so far seems to indicate I should look at
libnftnl and nftables but I'm not sure this is right.
Can you point me to the documentation for this? I've been looking online
for information on how to do this but haven't found anything really.

Thanks,
Thomas


--maPbx7OHBSpGd0RigO2TrJF9xDTqn915T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJVrryMAAoJEDZWLDUW2nDQmjoQAJDVRHFlcOhdLXFsFbKqYACz
r/SLxhuo7tvzlrM2Cf7o0rgObr38syrOIqohnLMie+tguG8AmH2PSKnmg3bRwF1d
oBiMwbnWPa1Ue4Q+8FgX1vsHcTGxPPi0lBEToKSZbmNNgVBQStummg9UM3QHBcaI
d5l6pQQoI9NC4EY5uJjykl8F/Qm5+HekC4Yrd5UGUIo9xA0PLgwvKlHh5guMDZVv
mw7LJl4MkTc8KR/Y8z6gkvIJK/ItMyhWu2QL1nXa+HGrKVNjI2MyNkEXbjoex4QL
sWKdcpOwf7MReu8Sh9gRrMOKkm3f8J8qfzQ/fbFo5PWqFwr1Db6bIS4lk0pxdojC
E26sgMgAAhGrq6NGCUNnNzUAEsHj2JFWlfFnKE3UPEkzkXGZhSvVUpzoL0v3bVZP
HRvUTICrbbzHPokjMQwalbVh1oIDvQWyAC7fnHj12Iz8EwnDl8r+8szilbB3MgVd
xw/7BrcsFH4WoHciiGXKdYdiTwQnbGyL0091K6X9pKcC5CvFfaO0HgcFi3R2kVt2
0zX6czPF+aaLJk1UvBN/ZeJAnH1K1Uir798aqc/orZz/8xjIWB5Q03DN859crJD0
2/WSvKtlf/Ky7DCIZ+q7HQXg8RAqNT3oRWQ1yBoO7DH+6Tay1GCo1kckQIxsB0MP
cWtPZCN0nlrvvBqqniR/
=6aKL
-----END PGP SIGNATURE-----

--maPbx7OHBSpGd0RigO2TrJF9xDTqn915T--
