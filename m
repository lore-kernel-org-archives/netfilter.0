From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@web.de>
Subject: Altering MTU in ICMPv6 packet too big message
Date: Wed, 24 Feb 2010 00:42:28 +0100
Message-ID: <20100223234228.GA3521@Linus-Debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi there,

we're having a buggy, closed source IPv6 router here, which keeps
announcing a wrong MTU via ICMPv6 packet too big messages. Is
there a way to modify the 1500 to a 1480 with a rule in the mangle
table on the host that receives those broken messages? I think
despite this one value, also the checksum would have to be
recalculated.

Cheers, Linus

PS: the tcpmss-target extension is not enough, as I'm still having
trouble with UDP packets.

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJLhGfjAAoJEBKw7u43QNpfoPUQAJGgkSN7BmWJpe2JiYCUeBzM
yAs7kZ7YeDxAIAlejPh27ZYloA8ml4DCVUYOruTJBMQyP9CYz5Fa02pXSZarKKnf
kfHor24QcxoQAqBW2e/U9Cg6ZHb9zJBSMOW2kEQE7NhiWTWaessmztcgxjsZU/W4
OoCY5R5vlf3tSGbAINldUGxYXQMHzMVO10hByqsqmVCvlwZWmMg/bjIXnNHh7+bZ
8Aaw70iGdrJcRIedw2WjXSrIjGq2cKwFje/APryQpvaYfl3YxD/4s+VC79L68wrS
UJKPT0nqCxWFcfqcCtPk8hyzJlu4BHYvz8jnWd8Lnsf1iULFwlaBqE6O9W5CxUZ7
rPBdxuUxRvIE4U9abOPH4IM5O09rxT0jjFAoeuaFYAyaoY1JLFypKjddxNv2BGIp
1h8ydPzbkIm4I9gi1gnAL6Op4RIfbI1rDTD8eRAeeDRJeUwEW1Ytx0goxlDgdEGQ
5lYZiVtn5MffK48bCJHxzfrqdaT+H35cQP+ZsfNGO96/iLx8UWOcqUTOL0i3erQM
vmxQ9QWUE2eQ3CwHSTXgyo+9oMwtNo0ctK/97ZfD6QQDSuhyicq9zPLBzhe64QOk
L6I5qYR91QSXF9esgCKu5igtJ4tSUvfl3IR8/LIOoSxLPnVtdprg53YfH0+SRGA0
pxyBDvDXEjzTV+XpV4uT
=wIH2
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
