From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 05 Nov 2014 20:57:43 +0100
Message-ID: <3816734.MmmqxbeP6W@nb003>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com> <4128127.KGiVEnbFtn@nb003> <CADuigkUu8wRJa-CqRNczJ009PPeDbnsu4jAarx2GuvwJygenPQ@mail.gmail.com>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1995396.PPTM09zK5i"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1415217467; x=1417031868;
	 bh=GbjKKyrf9mpCnE0TOZQ3SsOd/u57K9uw6yFGE3R6oN0=; b=iukWQlIKb78B
	8o3ghgVrANUjIIOUn4MFZZe2Uk8rRkg+tfKo00cIo6zXhvMBVuA9KBGDCqM+VA6c
	XwmvbCJHGXi4GoMcDezH87RNSnaJdlpZFGOQwEN6U1YhfmtZCRYwFP27v6clEP7o
	jtTD1YAYbhKt3gTZup+ACZfW0yjlu2fVlw4qni/PxjNURdRlhBfAS0kpok4nMGR6
	jsZo8T820ULOx1hk81IDUmpgI+dCvk3FOjxd/lA8YioVUxVUrLpbgPXJO9ibTkeG
	KuNdeXb0WbAMjRQm+IPqPG7StBuTwSk+CrT+3rb2yZFPHKOZRTNkca/3hAByHbbA
	D0IV1AwwIg==
In-Reply-To: <CADuigkUu8wRJa-CqRNczJ009PPeDbnsu4jAarx2GuvwJygenPQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


--nextPart1995396.PPTM09zK5i
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 5. November 2014, 17:50:05 schrieb Ricardo Klein:
> Michael,
>=20
> thanks for your repply, I forgot to mention that each one are in
> different places, so I wanted to set each local network to use the
> nearest firewall. And yes, I will have a hardware that can handle the=

> whole network.

Do you have a layer 2 connection between both locations? Or do you do s=
ome=20
dynamic routing changes in the case of a failover?
=20
> But, why not active/active?  (sorry for the silly question, if you ca=
n
> just point me to any good source I can read about, its ok, no need to=

> waste your time with this)

Source: Common sense.

A load-balancing firewall makes things complicated. Keep it simple, so =
it will=20
work reliable.


Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart1995396.PPTM09zK5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlRagTcACgkQsmtesqLuBDQOdAEAwCbre9TYd/+HaX+NcSBM59iH
9ekzWkor70pHvB2XF6QA/2jNeSqYX0n8IDmgmY4xFG0SrgFWKz8YYBIM08554773
=2qQO
-----END PGP SIGNATURE-----

--nextPart1995396.PPTM09zK5i--

