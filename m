From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: an annoying question
Date: Thu, 12 Feb 2004 07:15:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076562932.2827.99.camel@raylinux.internal>
References: <1076536430.10558.42.camel@gb7tf.org.uk>
	 <1076537678.1319.96.camel@elendil.intranet.cartel-securite.net>
	 <1076541042.6725.54.camel@gb7tf.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-P2RogDPAuv2J7ECIP8ZH"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076541042.6725.54.camel@gb7tf.org.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-P2RogDPAuv2J7ECIP8ZH
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-02-12 at 02:10, Richard Bown wrote:
> On Wed, 2004-02-11 at 22:14, Cedric Blancher wrote:
> > Le mer 11/02/2004 =E0 22:53, Richard Bown a =E9crit :
> > > I suspect from the results I've seen running 2.6.2 with iptables-1.2.=
9
> > > that the handling of DNAT & SNAT is very different.
> >=20
> > Afaik, from a user point of vue, there's no difference between 2.4 and
> > 2.6. I'm using a 2.6.1 kernel on which all the scripts I've written for
> > 2.4 kernels are working just the way they did before, for filtering,
> > mangling and nating...
> >=20
> > What kind of results makes you believe there are major differences on
> > NAT handling ?
> >=20
> Hi Cedric
> I'm using MDK 9.2 and iptables-1.2.9-4mdk plus shorewall 1.4.8-3mdk with
> kernel 2.4.22-26mddk
>=20
>=20
> when trying to run with kernel -2.6.2 shorewall stopped after an iptable
> invalid argument o n a rule starting DNAT.
> That rule was hashed out and all rules loaded , until the masq section
> which again halted shorewall.
Sounds like your kernel config doesn't have MASQ and/or NAT support. You
need to recompile the kernel with those options included.

> I tried an iptables -F to flush out all rules and allow networking but
> no avail.
> I really would like to knoqw whats happening so I understand what to do.
>=20
> Richard=20
> > One big difference is bridge interfaces handling, as physical interface=
s
> > cannot get matched using -i/-o switches anymore (br0 is seen through
> > them) so you have to use physdev match.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-P2RogDPAuv2J7ECIP8ZH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAKwv0h1fuR/Bv+ygRAlQ3AJ4umnby8c2rXyhVUJrwEkjMg+h86QCdEKkK
VRdbyBWthE3h2DV1/h32/gE=
=QNNU
-----END PGP SIGNATURE-----

--=-P2RogDPAuv2J7ECIP8ZH--


