From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: Weird routing problem. (I think)
Date: Thu, 06 Nov 2003 09:34:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068129245.22285.1.camel@main.tqmcube.com>
References: <003e01c3a471$3e8af660$0200010a@Tinkerbell>
Reply-To: IPTables Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-kdmP3LPBr+QiOckfJ0Ia"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003e01c3a471$3e8af660$0200010a@Tinkerbell>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Stephan Viljoen <steph@gabswave.net>
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>


--=-kdmP3LPBr+QiOckfJ0Ia
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-11-06 at 09:21, Stephan Viljoen wrote:
> Some off my clients started complaining that they're having problems
> connecting to my mail server. Now all this worked fine up until
> yesterday. I'm not blocking any ports nor am I blocking ICMP on the
> network.
>=20
Rather slow but  . . .=20

[root@mail2 root]# telnet 217.10.176.138 25
Trying 217.10.176.138...
Connected to 217.10.176.138.
Escape character is '^]'.
EHLO *****
220 gabswave.net ESMTP Exim 4.24 Thu, 06 Nov 2003 16:28:14 +0200
501 Syntactically invalid EHLO argument(s)
quit
221 gabswave.net closing connection
Connection closed by foreign host.


--=-kdmP3LPBr+QiOckfJ0Ia
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/qlvdol4OE0cpGaIRAhSBAKCZjgm5aI4knvsDmdskOjhDVF6SrwCgiPxb
QaZ5WdgsD/QMfAQtZ+X1VUU=
=6lwi
-----END PGP SIGNATURE-----

--=-kdmP3LPBr+QiOckfJ0Ia--


