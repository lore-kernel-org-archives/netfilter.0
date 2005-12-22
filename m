From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: Re: ICMP types to allow
Date: Thu, 22 Dec 2005 01:32:26 +0100
Message-ID: <20051222003226.GJ25728@nightfall.luchs.at>
References: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
	<1135192930.4872.4.camel@anduril.intranet.cartel-securite.net>
	<1135202461.30754.38.camel@siren.chrisbrenton.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nOM8ykUjac0mNN89"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1135202461.30754.38.camel@siren.chrisbrenton.org>
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
To: netfilter@lists.netfilter.org


--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 21, 2005 at 1701 -0500, Chris Brenton appeared and said:
> On Wed, 2005-12-21 at 20:22 +0100, Cedric Blancher wrote:
> >
> > In addition to this, Netfilter, unlike some popular proprietary
> > products, provide a proper stateful ICMP filtering. Just use it. Valid
> > ICMP errors will fall into RELATED state, others will be INVALID.
>=20
> Agreed. The payload on ICMP errors (which contains 28 bytes of the
> packet which generated the error) is inspected and compared against the
> state entry. This mean RELATED is more than capable of letting through
> needed ICMP errors and dropping the bogus stuff. So you are cool with
> types 3,4,5, & 11. The average perimeter does not need much more than
> that.

In addition to that you can add some general size limits for ICMP
packets. Theoretically ICMP packets can have 64 kB and there are tools
out there that use oversized packets for tunneling data.=20

Best,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqfQaeMu5lRpXJ7kRAjjQAKCwZ4TW/GUn2CI1qasvjnTGM2Va+QCguS4I
EPqKfrz5ZKPVCJfgpV1VBf4=
=7boF
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--

