From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Blocking Squid Requests
Date: 08 May 2003 08:59:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052377183.1766.49.camel@raylinux.internal>
References: <001801c31490$fd031670$7107a8c0@maninho>
	 <200305072127.03670.lyra@fastwebnet.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Wb5SKizsH4+FRjE8R9dp"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305072127.03670.lyra@fastwebnet.it>
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


--=-Wb5SKizsH4+FRjE8R9dp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-05-07 at 21:27, xchris wrote:
> On Wednesday 07 May 2003 14:05, Walter Priesnitz Filho wrote:
> > Hi,
> > I have this environment, a subnetwork (192.168.0.0) that access another
> > subnetwork (192.168.59.0) and then access the internet. The second lan =
has
> > a proxy server (squid:3128).
> > I need to block the requests in th first lan to the squid server to som=
e
> > sites. How can I do this?
> > I've tried this
> > iptables  -A FORWARD -p tcp -m multiport --dport 80,443,3128 -d
> > www.someplace.com -j DROP
> > but doesn't work.
> > Can anybody help-me?
>=20
> why don't use OUTPUT/INPUT  chain?=20
> you disable output/input from the lan to your firewall (so squid doesn't =
get=20
> requests)

Why not use squidGuard? Or even squid a squid acl?



--=-Wb5SKizsH4+FRjE8R9dp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+ugBeh1fuR/Bv+ygRAituAJ9lT689Ofw3LGFOmN2XTczbTDILIgCgqTyV
SYO10SepTB1ALpm19mr1qvk=
=zzjd
-----END PGP SIGNATURE-----

--=-Wb5SKizsH4+FRjE8R9dp--


