From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Source NAT in  POSTROUTING chain for locally generated packets
Date: Sun, 31 Aug 2014 16:19:31 +0200
Message-ID: <1871539.DT9Mib6pZX@nb003>
References: <1613016.CfItKYvQAW@nb003> <53FFA866.6020908@plouf.fr.eu.org>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11478685.Y1iSOK8n3M"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1409494775; x=1411309176;
	 bh=5XgdSfiymtYJcMFK/2bTtq1koagZF/ldpbTHyV8HbSs=; b=XX57SPSGx7lj
	F2senYd1Pwex/O0hA4Yqf8pQZEAjcYPds1RAth3DNoEm3ICVt4lbWI0smX4limiY
	Ba5AwYjm9HwdjY/XgM7+/PqRG/QRlK40wcTwtD3EZ20kdpUv16r/6g2+H7c6rIYe
	nLDT5+2jLHvVUmuU0Tph2lcvEKv/qTNKOOr6wjuUa3bNobj8/Fk3Tt1gI7rJmzCs
	TZ0fp75DUWqujRrLI1y9cUY+/8xJ1LDDUZTYmDdLQKh0q+OWqUj+PuoCzgiuMltu
	z+SY0NZvxDLJeuqTQBdVUjjNGdZNs1IDu3O2GbNwD2j561wj4JkSJuxy968g3Miz
	f4AY33H1mA==
In-Reply-To: <53FFA866.6020908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--nextPart11478685.Y1iSOK8n3M
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

SNAT indeed alters the source port that is why the client does not reco=
gnizes=20
the packet now. But I did not find any way not to alter the source port=
.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart11478685.Y1iSOK8n3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlQDLvMACgkQsmtesqLuBDQ6GQEAjVouxHkVc8B0mVv/gjmAmwT1
9aT/RiQShvHiwMP+NT0A/3yC0cj2A2G5GMsH3XW+SEzzX6sgEnAy4x8mxBe999wv
=6//G
-----END PGP SIGNATURE-----

--nextPart11478685.Y1iSOK8n3M--

