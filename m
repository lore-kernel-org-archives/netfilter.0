From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: policy based routing using netfilter
Date: 16 Sep 2003 18:35:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063730135.31314.169.camel@raylinux.internal>
References: <20030916161205.GA29762@quist.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-wkQMVvapo4MtEOYxfdy7"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916161205.GA29762@quist.ca>
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


--=-wkQMVvapo4MtEOYxfdy7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-16 at 18:12, Russell P. Sutherland wrote:
> I would like to build a route server using Zebra
> and Linux.
>=20
> What policy based routing options are available using
> netfilter?
>=20
Basically any rule you can write with iptables.

> Can I, for example have a separate routing table for
> each class of traffic?
>=20
Yes, but that's ip route2, not netfilter.

> A pointer to the relavent sections in the netfilter
> docs would be much appreciated.
>=20
hmmm... I think I found that out via the advanced routing howto? Can't
remember. Check www.linux.org

> Thanks in advance.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-wkQMVvapo4MtEOYxfdy7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZzvXh1fuR/Bv+ygRAmZoAJ99uHJ31gT4ItHt6bYF5QvWZwl2ogCgmFqB
j1sp+JnQYyTM4iv4dB7hUyo=
=2tDm
-----END PGP SIGNATURE-----

--=-wkQMVvapo4MtEOYxfdy7--


