From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: how do I port forward through loopback?
Date: Wed, 19 May 2004 07:31:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084944673.19268.7.camel@raylinux.internal>
References: <40AA16A7.1010706@shadowpuppets.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+KRGPJtYF3Yz0ycySM4K"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40AA16A7.1010706@shadowpuppets.net>
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


--=-+KRGPJtYF3Yz0ycySM4K
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-05-18 at 15:59, Mark wrote:
> Hello,
> I need to port forward all traffic locally going to port 80 to port=20
> 8040.  For the external interface eth0 this works, I thought it would=20
> work for the internal/loopback as well. Nothing else is turned on
> , all other settings are open.
>=20
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT=20
> --to-port 8040
>=20
> this doesn't work for the internal network, 127.0.0.1 lo, not sure why
> System info: Redhat7.3, 2.4.20 kernel, iptables-1.2.8-8.72.3
> Thanks

To get nat to work on the local interface you have to compile the kernel
with local nat support. The catch is that normal nat stops working.

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-+KRGPJtYF3Yz0ycySM4K
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAqvEhh1fuR/Bv+ygRAvdfAJ0Q+s+M/tGY1gcvoTpOBeetgPONAgCghae5
V2kuujCXT/nHU7Ge4q6xVds=
=78gh
-----END PGP SIGNATURE-----

--=-+KRGPJtYF3Yz0ycySM4K--


