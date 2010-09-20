From: Tom Eastep <teastep@shorewall.net>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 16:55:12 -0700
Message-ID: <4C97F460.8000908@shorewall.net>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig82B33E273CFEF8DD0A3C666B"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig82B33E273CFEF8DD0A3C666B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 9/20/10 4:26 PM, Jan Engelhardt wrote:
>=20
> On Monday 2010-09-20 23:49, Tom Eastep wrote:
>>> printf("selctx %s ", info->u.sel.selctx);\
>>
>> That breaks iptables-save/-restore. The attached patch does not.
>=20
> But still has the rogue \ at EOL.

Yes, I see that harmless character is in the current source and that I
failed to delete it when I cloned the function.

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--------------enig82B33E273CFEF8DD0A3C666B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyX9GoACgkQO/MAbZfjDLK6MACgy4vYOIVei506DEpUBVS+xTAP
Fq0Anj313u0OGoOlTjnUxXudtPxXpbbI
=HFYY
-----END PGP SIGNATURE-----

--------------enig82B33E273CFEF8DD0A3C666B--
