From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Tool for monitoring, graphs, but more detailed
Date: Thu, 29 Jun 2006 20:13:24 +0200
Message-ID: <20060629181324.GA12110@zion.homelinux.com>
References: <001701c69ba4$07144ab0$0a00000a@poseidon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001701c69ba4$07144ab0$0a00000a@poseidon>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Rafael Marangoni <listas@rafa.eti.br>
Cc: netfilter@lists.netfilter.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Rafael,

did you take a look at ntop?? http://www.ntop.org
Gives you quite detailed view of what's going on...really good
utility in my opinion, but may perhaps take quite some cpu
power and hard disk space...

hope this helps...



have a nice day :-)

Sven


On Thu, Jun 29, 2006 at 02:47:02PM -0300, Rafael Marangoni told us:
> Hello!
>=20
> Well, I'm looking for a tool that can help me with a question: make
> reports/graphics of the traffic passing through some firewalls (Linux
> gateways, using iptables and others tools).
>=20
> Yes, I know about MRTG and some others, but it makes graphs of the
> entire traffic, and can't explain more detailed.=20
>=20
> I need to explicit the traffic:
> 	- smtp traffic;
> 	- web (http/https) traffic;
> 	- gree traffic;
> 	- udp ;
> 	- icmp;
> 	- etc....
>=20
> Ok, it can work in the concept of ports, and don't need to open the
> packets passing through to know what type of TCP packet is it (example:
> TCP 80 is http, TCP 25 is SMTP).
>=20
> Searching, googling,...., I encountered a very good site (Stanford
> University) that collected many tools for monitoring, and probably
> anyone posted it here, but I'll do it again:
>=20
> http://www.slac.stanford.edu/
>=20
> But there looks like that doesn't have what I'm looking for.
>=20
> And tools like iptraf, don't help me, because I need graphs, beauty
> graphs ;).
>=20
> Anyone can help me with this question?!
>=20
> Thanks for all!
>=20
> Rafael Marangoni
>=20
>=20
>=20

--=20
Linux zion.homelinux.com 2.6.17-rc5-mm1_35 #35 Tue May 30 14:11:06 CEST 200=
6 i686 athlon i386 GNU/Linux
 20:12:56 up 28 days, 20:57,  3 users,  load average: 2.28, 2.15, 2.12

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEpBhEo4FAdB2PneQRApEfAJ9bzI5rX2fDU7sdfu2egPtoOFO8wACaAkMs
J1ZYLz6fqyern80j1G4Vu4Q=
=vIZd
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

