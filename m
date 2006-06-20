From: Eric Leblond <eric@inl.fr>
Subject: Re: conntrack utility
Date: Tue, 20 Jun 2006 23:51:38 +0200
Message-ID: <1150840298.23087.5.camel@porky>
References: <44982BF1.8090102@regnard.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-3tr1SFq9KdzmsSxvZ7MT"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44982BF1.8090102@regnard.org>
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
To: devel@regnard.org
Cc: netfilter@lists.netfilter.org


--=-3tr1SFq9KdzmsSxvZ7MT
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

In fact it works !

But you mainly have to use subversion to get something working with
recent kernel.

An alternative is to use the archive I've generated in the scope of nufw
and of an article to come in Linux Magazine France :
	http://www.nufw.org/download/libs/

Netfilter core team are aware of the problem and should do a release
quiet soon. But they are quiet busy nowadays :-(

BR,

On Tue, 2006-06-20 at 19:10 +0200, Vincent Regnard wrote:
> Hi,
>=20
> I've been playing with the conntrack recently, mainly to get=20
> conntrack_sip working. Because I had some problems having it working on=20
> a router with no nat. I compiled the conntrack utility, expecting to=20
> make some debug with it. But I cannot have the conntrack utility=20
> working. I use latest available version of the required libs and utility:
>=20
> - libnfnetlink-0.0.14
> - libnetfilter_conntrack-0.0.30
> - conntrack-1.00beta1
>=20
> together with a kernel 2.6.16.20 and iptables 1.3.5
>=20
> When invoking conntrack as root I always get the following error:
>=20
> Operation failed: invalid parameters
>=20
> I am apparently not the only one having this kind of trouble (cf this=20
> list post on february 17th). I am wondering if there is any chance I can=20
> have a release of conntrack working. Do some of you have it working (if=20
> so what version of the libraries/conttrack do you play with ?).
>=20
> If you have any hints, I would be glad to ear from you. Just knowing it=20
> work somewhere else and people use it sometimes would make me happy, so=20
> I could carry on compiling on other environement and pray god a bit more=20
> longer.
>=20
> thanks for your feedback
>=20
> Vincent
>=20
--=20
Eric Leblond <eric@inl.fr>
INL

--=-3tr1SFq9KdzmsSxvZ7MT
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEmG3pnxA7CdMWjzIRAhphAJwNzBkN5sWPUfGLq7ihFyLmojfXBACfUSEp
Gq6cn+ArqAfDzpZG97FNSH0=
=9Sm7
-----END PGP SIGNATURE-----

--=-3tr1SFq9KdzmsSxvZ7MT--


