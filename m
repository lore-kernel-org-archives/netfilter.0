From: Martin Millnert <millnert@csbnet.se>
Subject: Re: Select chain from set?
Date: Tue, 28 Apr 2009 14:27:25 +0200
Message-ID: <1240921645.14474.141.camel@hsa.vpn.anti>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-4KeTHE2HZfG7zN0WIsFx"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter@vger.kernel.org


--=-4KeTHE2HZfG7zN0WIsFx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-04-28 at 11:21 +0200, Oskar Berggren wrote:
> Hello,
>=20
> is it possible to have iptables query a set of some sort to quickly
> look up a chain to jump to for a specific packet?
>=20
> For example the set would contain a mapping from ip-address ->
> chain-name. Then the destination address is looked up in the set and
> iptables would jump to the specified chain.
>=20
> Is it possible, or how difficult would it be to implement something
> like this? I'd imagine it would be implemented as a target, that would
> have the ability to "redirect" to another target, which would be a
> chain.
>=20
>=20
> /Oskar

Hi Oskar,

to my knowledge there is no current such functionality. But I second the
usefulness of such a function. It would be especially useful to replace
traditional "match trees" of today, to reach down to a per
customer-chain for inwards and outwards matching.

It seems like it would be beneficial to let it be very similar to the
ipset of today, in that you would be very well of in having multiple
such sets to jump to as a target.  Thus you could easily use normal
matchings to decide whether or not to perform this sort of look-up.
  It would be useful if each such set would contain the possibility to
match on either source address/netmask and destination address/netmask.

This all begs the question on how effective some tree structure with -g
is implemented, to figure out how much of a performance benefit such a
new target would have over a treelike chain structure. =20

It would indeed be useful to have it all as a single target however,
save a lot of rules and also be much more readable.

Is it possible to easily extend ipset to perform this?

More input appreciated.

Regards,
--=20
Martin Millnert <millnert@csbnet.se>

--=-4KeTHE2HZfG7zN0WIsFx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAABAgAGBQJJ9vYlAAoJEKregIBmHNFOdnMQAN+zfIdynCv/EQPEw61NCiNZ
RajBXXCbhqRT54f8iDtOC97bHeUAbldC1eEGxp1SS0ZV+PZMDXlnx3FSvZEVSLbA
FS57W9csdYlbAuW7DhbOgJGXrmXrHaPRz7kgW3jUF8DZa7Wq+LCrIsXeAAwBuiDY
yU520DWFTuf+asNN+HuV0ZO47MLVafNpztFsWW1MZQ5GhWs7FQHlxFoJmG8LUJjl
mjAb19Vb3MB0bgMGLW1Ax6aGwEChCkhJf0JWRbrj9UezebyP+jWOmfcwk/7FUIwM
6mlQLrIhsuvs0gvAdXJM3qRMTibG6c2U7bYblwOEA56xJkWonhlb1BnYnNxsgl55
S51MpSwVE/CbgssqskEfzZoaKuDUmaR5kdXxrD0vCEMo1uJHVMHMkO6aA17IqJSd
5iQuEv73MlqITguXedSeWlpVBzjc72fSSTIWDlAedsLyWGMtzehEupHvSXufcJZu
pHheBngfTnNVeAXi8kvwlkYmg6mhd7hLAeRZqg7SMRYwoiLd8r0FM2dNcpPw3ppK
XYHmef1iEQaY4CiSGNAe4aLd4uHeugiY0eVv7J0ELO3G46j8avjWpHLFRkHWmXBm
z2OuE+lyE3M0YKT72cYi2SQEUSru+yKxLUfI9SbPXu4kzUQYQtexHVQaX2stepLD
eilT5GgF6HmsVSTu2iHQ
=uY9B
-----END PGP SIGNATURE-----

--=-4KeTHE2HZfG7zN0WIsFx--

