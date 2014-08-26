From: Michael Schwartzkopff <ms@sys4.de>
Subject: Source NAT in  POSTROUTING chain for locally generated packets
Date: Tue, 26 Aug 2014 08:38:32 +0200
Message-ID: <1613016.CfItKYvQAW@nb003>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1810896.WoBWNDzM7N"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:user-agent:organization
	:message-id:date:date:subject:subject:reply-to:from:from; s=
	mail201310; t=1409035119; x=1410849520; bh=I4zKOtYnmx4kPhqkITC5u
	1zmgf+RcVYArUsZwz7kI9k=; b=pwgoXofRvqc8XFFKD7AJSw+f/eI6/rpbfdbvU
	tcQTFNuv+xPpTTKEQOkdh4zt3jR4MqJj3NWmNf013HLLWOz7rpjKJw73ESEHjN11
	zqWN0EEaPpZTl7mhF3kAR2XOCgj3tqnMQrUdiIDjmIjB/yBQpG8VhX7j+2aSR8O3
	5nPnbyzTuK5E/YY6JUkD95mkL8m5BlDMBZc7SQ9FWUDjf2hooFbvkcdaA0Y4ckFk
	gDlAz0lPpc1QS0yictsob/7SLjLo+x7668p9O4Wg+MB8mRh+4CnpWRpuMImE2WVI
	bBojkg8X8bhYp/s5S9CSA4pn4U4t7fjPu2lylOmRDdPRWiTeA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--nextPart1810896.WoBWNDzM7N
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

For some special reasons I want to alter the IP address of outgoing pac=
kets=20
that are generated locally to a secondary IP address on my machine. For=
 a test=20
I use the udp/echo service. Without any rules a tcpdump looks like this=
:

192.168.56.101 is the primary address of the echo server and 192.168.56=
.16 is=20
the secondary address of the interface.

08:24:04.063987 IP 192.168.56.1.48462 > 192.168.56.16.echo: UDP, length=
 6
08:24:04.064522 IP 192.168.56.101.echo > 192.168.56.1.48462: UDP, lengt=
h 6

So I add the iptables rule:

iptables -t nat -I POSTROUTING -p udp -s 192.168.56.101 --sport 7 \
  -j SNAT --to-source 192.168.56.16

now tcpdump shows that no answer packet is sent out any more:

08:24:16.851095 IP 192.168.56.1.55362 > 192.168.56.16.echo: UDP, length=
 6


With iptables -t nat -L POSTROUTING I can see that the rule is hit sinc=
e the=20
counter increases. Also a iptables TRACE shows me that the rule is hit.=
 No=20
filter appears in the TRACE log.

Any ideas where the packet vanished?


Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart1810896.WoBWNDzM7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlP8K2gACgkQsmtesqLuBDQGOQEAwXCx5ty6IXSqcxuC4b2yL6rV
RLvvuXjCsnKfRjLH8NwA/RzoUsZMQtGwGv9QDJp4u32qLCr2DlrfaFDwD7+4yxWQ
=A7c4
-----END PGP SIGNATURE-----

--nextPart1810896.WoBWNDzM7N--

