From: Andy Smith <andy@strugglers.net>
Subject: Re: When do the rule apply?
Date: Wed, 15 Jun 2005 20:10:07 +0000
Message-ID: <20050615201007.GA754@strugglers.net>
References: <393114f905061513012ac2216a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nktOf83SvqltY3iw"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <393114f905061513012ac2216a@mail.gmail.com>
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


--nktOf83SvqltY3iw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2005 at 10:01:54PM +0200, Alexander Salmin wrote:
> Hi, I guess this question is just a silly one for experts, but I can't
> find the answer anywhere so I'm asking you guys.
>=20
> In what order do the assigned rules apply in this script?=20
>=20
> # Example1
> iptables -A INPUT -j DROP # rule #1
> iptables -A INPUT --dport 80 -j ACCEPT # rule #2
>=20
> #Example2=20
> iptables -A INPUT --dport 80 -j ACCEPT # rule1
> iptables -A INPUT -j DROP # rule2

They apply in the order you've issued them since they are operating
on INPUT and they are appending.

> Will the both examples produce the same result?

No; example1 drops everything to INPUT with rule 2 never being
reached, but example2 would ACCEPT packets to port 80.. although
wouldn't that be a syntax error without at least -p tcp or -p udp to
tell it that it is something that has ports?

> Or will rule2 in example 2 make rule1 in example2 vanish because it's
> telling the system to drop all?

No, rules don't affect other rules.  They may not be reached however.

--nktOf83SvqltY3iw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCsIsfIJm2TL8VSQsRAiZJAJ0RXl9JI1L16tmAG6CkfJYQrByNVACeKZEZ
D7FGVJfJxmaPNWYnfZ+KqUQ=
=GTok
-----END PGP SIGNATURE-----

--nktOf83SvqltY3iw--

