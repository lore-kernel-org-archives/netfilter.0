From: Joshua N Pritikin <jpritikin@pobox.com>
Subject: Re: FAQ 3.13, but on the same box
Date: Mon, 19 Jul 2004 07:30:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040719020059.GC679@always.joy.eth.net>
References: <20040718173200.GC718@always.joy.eth.net> <200407181844.22744.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407181844.22744.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 18, 2004 at 06:44:22PM +0100, Antony Stone wrote:
> On Sunday 18 July 2004 6:32 pm, Joshua N Pritikin wrote:
> > I understand how to set up a transparent proxy.  However, it is
> > possible to run a transparent proxy and web browser on the same box?
>=20
> Yes.
>=20
> > What if I put the proxy on a loopback interface and REDIRECT port 80
> > to port 3128 the loopback?  Would that work?
>=20
> Sounds good to me.
>=20
> http://www.squid-cache.org/Doc/FAQ/FAQ-17.html#ss17.4

This FAQ doesn't address my question.  I also looked at "Transparent
Proxy with Linux and Squid mini-HOWTO" by Daniel Kiracofe.

So far, all docs assume that the squid-box and the browser box are
different machines.

Hrm, I think I need to add an OUTPUT rule that matches on the owner.
If --uid-owner=3Dproxy then the packet should not REDIRECT back to port
3128.  Something like that?

--=20
A new cognitive theory of emotion, http://openheartlogic.org

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA+ytbqcqnlKSmC70RAs70AKDFu/IkNyeSNxhkSQgzb71M+PuKUwCeJbIr
+eQO0AI31v08SCKf9gcO9ww=
=9KYS
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--

