From: Alexander Samad <alex@samad.com.au>
Subject: Re: blocking a site for others not for -m owner
Date: Thu, 8 Jul 2004 15:16:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708051649.GB16285@samad.com.au>
References: <a0f69e50407072156420fc7aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a0f69e50407072156420fc7aa@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter <netfilter@lists.netfilter.org>


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2004 at 09:56:37AM +0500, Askar Ali Khan wrote:
> Salam
>=20
> Im trying own my home box (standalone) which is directly connected
> with net via ppp0 (dialup). I got a three user accounts on this box
> only for practice purpose.
> Now im trying to block a site www.foo.com for users excluding user
> "askar" with something like....
>=20
> #iptables -A OUTPUT -p tcp --dport 80 -d www.foo.com -j DROP
>=20
>        this works for all users however when I tries to exclude user
> "askar" from this blocking with...
>=20
> #iptables -A OUTPUT -p tcp --dport 80 -d www.kmmod.com -m owner
> --uid-owner askar -j ACCEPT

-A means to append to the end of the table, if you do it in the order
above it will not work

try -I for the second one

>=20
>               site is still block for user "askar", i also tried with
> changing the other of the rules no working :), Howto exclude "askar" ?
> my default chain polices ...
>=20
> Chain INPUT (policy ACCEPT)
> Chain FORWARD (policy ACCEPT)
> Chain OUTPUT (policy ACCEPT)
>=20
> Regards
> Askar
>=20
>=20

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA7NjBkZz88chpJ2MRAtA2AKDiMH3bD9Kr5HaxCU+E8Mjk7AIi+wCeNlbT
DSMLycK9Djrxiwk4/3NQqtQ=
=S2Zv
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--

