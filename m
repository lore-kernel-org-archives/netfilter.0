From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Mail Through Firewall
Date: Wed, 18 Feb 2004 16:09:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077113362.2333.145.camel@raylinux.internal>
References: <012201c3f627$18eabbe0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZXFUIw8F7ENEPbcn4koa"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <012201c3f627$18eabbe0$49caa8c0@caris.priv>
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


--=-ZXFUIw8F7ENEPbcn4koa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-02-18 at 15:57, Peter Marshall wrote:
> Hey, I am sure this question is going to seem trivial to everyone here ..
> but I will ask anyway.
> I want to get outlook to work on my inside box .... I have it all set up
> correctly, but it can't find the pop / smtp servers ...
>=20
> I ran ethereal to see what the problem was ...
> When I try to connect I get 3 requests
> source 10.0.0.2
> dest 10.0.0.255
> Protocol NBNS
> source and dest ports: 137
>=20
Definitely not smtp or pop3 traffic. pop3 is port 110 and smtp is port
25.

Port 137 is NBNS (NetBIOS name service). Your outlook client is
broadcasting (10.0.0.255) on the local LAN, probably looking for a
domain controller.

> and I get no reply's ... ( well, I get an arp request after the 3rd try .=
..)
> Any ideas how to get this working ?
>=20
> BTW, I am using IPTables
>=20
> Thanks
> Peter Marshall
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ZXFUIw8F7ENEPbcn4koa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAM3ISh1fuR/Bv+ygRAmVKAJ4+uUOX6sphM0BikmLzcs0qcFl3QwCdHv8b
qi2niSE9kN64oYPts+dHrjk=
=5PV4
-----END PGP SIGNATURE-----

--=-ZXFUIw8F7ENEPbcn4koa--


