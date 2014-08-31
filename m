From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Source NAT in  POSTROUTING chain for locally generated packets
Date: Sun, 31 Aug 2014 17:42:58 +0200
Message-ID: <25646646.sHMRAX5bUJ@nb003>
References: <1613016.CfItKYvQAW@nb003> <1871539.DT9Mib6pZX@nb003> <54034037.8020304@plouf.fr.eu.org>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1857056.gk7cXH3SRB"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1409499786; x=1411314187;
	 bh=1ztg32pB9yK1n7Sx0Cv3mcNMPuWj4bJ++CBn7i1Fs9c=; b=wuohi3Q/k/mM
	B1irwhgXuvHV8WjC70YoXDvjSuc80ouK2ThoRykBror7aYbseFuSSpPBYsQlLHRs
	3zWMIodb/jW5hWjuIU8iuNSh9QBHascosYkMYVUwhM66VbsogtlFqzsMdyO+H31u
	T19bf+HYMmApnBwzefr+t8Rx3FWQh6dtjYV/deJBvnIVfM+PC0+ULoXRStwTA3Bp
	Xlzxr+wuQ/C1Y8HSmk8/P7BxWmfXnGMOx1DRacaggTHB54c2khK58gWeZ1G4Nbkt
	WUrc7FOrh+1A6peKTRGnyevSImcUT/oRIypgi2YuDu2SnlNxMo6IJq1kcrSJCPWQ
	Vu4d40ZvbQ==
In-Reply-To: <54034037.8020304@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org


--nextPart1857056.gk7cXH3SRB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Sonntag, 31. August 2014, 17:33:11 schrieben Sie:
> Michael Schwartzkopff a =E9crit :
> > Am Freitag, 29. August 2014, 00:08:38 schrieb Pascal Hambourg:
> >> Michael Schwartzkopff a =E9crit :
> >>> For some special reasons I want to alter the IP address of outgoi=
ng
> >>> packets
> >>> that are generated locally to a secondary IP address on my machin=
e. For
> >>> a
> >>> test I use the udp/echo service. Without any rules a tcpdump look=
s like
> >>> this:
> >>>=20
> >>> 192.168.56.101 is the primary address of the echo server and
> >>> 192.168.56.16
> >>> is the secondary address of the interface.
> >>>=20
> >>> 08:24:04.063987 IP 192.168.56.1.48462 > 192.168.56.16.echo: UDP, =
length
> >>> 6
> >>> 08:24:04.064522 IP 192.168.56.101.echo > 192.168.56.1.48462: UDP,=
 length
> >>> 6
> >>>=20
> >>> So I add the iptables rule:
> >>>=20
> >>> iptables -t nat -I POSTROUTING -p udp -s 192.168.56.101 --sport 7=
 \
> >>>=20
> >>>   -j SNAT --to-source 192.168.56.16
> >>>=20
> >>> now tcpdump shows that no answer packet is sent out any more:
> >>>=20
> >>> 08:24:16.851095 IP 192.168.56.1.55362 > 192.168.56.16.echo: UDP, =
length
> >>> 6
> >>>=20
> >>> With iptables -t nat -L POSTROUTING I can see that the rule is hi=
t since
> >>> the counter increases. Also a iptables TRACE shows me that the ru=
le is
> >>> hit. No filter appears in the TRACE log.
> >>>=20
> >>> Any ideas where the packet vanished?
> >>=20
> >> Clash with an existing connection entry (the one created by the in=
coming
> >> packet) -> source port changed or packet dropped.
> >=20
> > SNAT indeed alters the source port that is why the client does not
> > recognizes the packet now. But I did not find any way not to alter =
the
> > source port.
> The situation is unclear. In your previous reply, you wrote :
> > Since I so not filter on existing state, the packet should not be d=
ropped
> > anyway.
>=20
> The NAT table can drop the packet by itself when the clash with an
> existing connection cannot be avoided (usually by changing the source=

> port automatically). Here, the existing connection is the one created=
 by
> the incoming packet. However, the SNAT rule does not force the source=

> port, this should not happen.
>=20
> >> What was the full tcpdump command used ?
> >=20
> > Yes. tcpdump should have captured the package.
> >=20
> >> Any filters ?
> >=20
> > No filters at all.
>=20
> If you did not set any filters in tcpdump, it should indeed have
> captured the outgoing packet. What have you changed ?
>=20
> What is your real goal ?
> My guess is that you want to SNAT the outgoing packet so that it look=
s
> like the expected reply for the client. IMO this is the wrong way of
> doing things. Instead you should consider using DNAT (or maybe REDIRE=
CT)
> on the original request packet to redirect it to the  primary address=
 of
> the server, 192.168.56.101, so that the reply packet from that same
> address is considered as part of the same connection and is
> automatically de-NATed with the original address.

Yeah. DNAT works. Thanks.

> A better fix would be that the server sends the reply from the same
> address as the one it received the request on. If the echo service is=

> part of inetd, that can be done in inetd.conf by specifying the local=

> address to use.
>=20
> 192.168.56.16:echo     dgram   udp     wait    root    internal

echo only was an example. The real service does not offer that possibil=
ility=20
to bind to a single IP address. That also was max first idea.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart1857056.gk7cXH3SRB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlQDQoIACgkQsmtesqLuBDQDIgD7Bi4GuWrYUchNvjzEGhf3w+3U
NDwmv7AIkz3hCapC4zQA/1X8LrafVheuxSHFghNyActirixiHDZQLI8Y01fuSRgx
=iNPZ
-----END PGP SIGNATURE-----

--nextPart1857056.gk7cXH3SRB--

