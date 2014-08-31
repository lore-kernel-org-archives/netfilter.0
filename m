From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Source NAT in  POSTROUTING chain for locally generated packets
Date: Sun, 31 Aug 2014 14:05:29 +0200
Message-ID: <4930481.2zCM96A4n3@nb003>
References: <1613016.CfItKYvQAW@nb003> <53FFA866.6020908@plouf.fr.eu.org>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2372444.ibUYIdcTcq"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1409486742; x=1411301143;
	 bh=haircg6RkZtm2k4RWk4A2t8HmOkyoCsc8aidsujQI9Q=; b=r7rCq6D4pNyf
	d3GUJBCrkFEULAYbqTYky9eLJig2zmvHPPD2KtAGIlNuwzqW2L/GawbSVb+UAYle
	XdomVgK2T2waqWiLqHds5as3E0GneVMo/gsquj90mQvKG6mo07P5JiXcFh+MAlrL
	ugb2NWIxL9eFSO8LlNHdFhjltcb6g8TsSjinB9WeDUQdMVVaQb2QPN3gKFMzKsdB
	FTCeDTZvqRxGp7AXfjh7CWM4kNtVmlwzTMNNOLtvgoHGPDAe+tox4VzBkS1hGRti
	AbuT87pp/akQu7PFo0oUpSdx+Iuh0Z+BR/Yv2IiVWwgFXxogWYmVeCwkWzlb/iOK
	tL5l2URUcg==
In-Reply-To: <53FFA866.6020908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--nextPart2372444.ibUYIdcTcq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 29. August 2014, 00:08:38 schrieb Pascal Hambourg:
> Hello,
>=20
> Michael Schwartzkopff a =E9crit :
> > For some special reasons I want to alter the IP address of outgoing=

> > packets
> > that are generated locally to a secondary IP address on my machine.=
 For a
> > test I use the udp/echo service. Without any rules a tcpdump looks =
like
> > this:
> >=20
> > 192.168.56.101 is the primary address of the echo server and 192.16=
8.56.16
> > is the secondary address of the interface.
> >=20
> > 08:24:04.063987 IP 192.168.56.1.48462 > 192.168.56.16.echo: UDP, le=
ngth 6
> > 08:24:04.064522 IP 192.168.56.101.echo > 192.168.56.1.48462: UDP, l=
ength 6
> >=20
> > So I add the iptables rule:
> >=20
> > iptables -t nat -I POSTROUTING -p udp -s 192.168.56.101 --sport 7 \=

> >=20
> >   -j SNAT --to-source 192.168.56.16
> >=20
> > now tcpdump shows that no answer packet is sent out any more:
> >=20
> > 08:24:16.851095 IP 192.168.56.1.55362 > 192.168.56.16.echo: UDP, le=
ngth 6
> >=20
> >=20
> > With iptables -t nat -L POSTROUTING I can see that the rule is hit =
since
> > the counter increases. Also a iptables TRACE shows me that the rule=
 is
> > hit. No filter appears in the TRACE log.
> >=20
> > Any ideas where the packet vanished?
>=20
> Clash with an existing connection entry (the one created by the incom=
ing
> packet) -> source port changed or packet dropped.

Since I so not filter on existing state, the packet should not be dropp=
ed=20
anyway.


> What was the full tcpdump command used ?

Yes. tcpdump should have captured the package.


> Any filters ?

No filters at all.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart2372444.ibUYIdcTcq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlQDD4kACgkQsmtesqLuBDRFsAD/fn0JOxiEr4sr0XxezKUAEDhG
EaO8SVIX3A4S7pNSoP0A/0fMxpfxS2X+kZYuqUC5bbm6P6uhFcA4J+Gnc+LRhPAS
=s7Zl
-----END PGP SIGNATURE-----

--nextPart2372444.ibUYIdcTcq--

