From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Loose source routed IP packets.
Date: Tue, 23 Sep 2003 15:37:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064324242.25975.111.camel@raylinux.internal>
References: <200309231347.57709.carles@unlimitedmail.org>
	 <Pine.LNX.4.51.0309231409290.14794@dns.toxicfilms.tv>
	 <1064320275.31340.104.camel@raylinux.internal>
	 <3F704912.6010800@chrisbrenton.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0aqYFzI3KcwpVYbfd3z9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F704912.6010800@chrisbrenton.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-0aqYFzI3KcwpVYbfd3z9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-23 at 15:22, Chris Brenton wrote:
> Ray Leach wrote:
> >=20
> > How about :
> > ### don't accept source routed packets
> > /bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
>=20
> I keep meaning to do some testing with this but have not had the=20
> bandwidth. Just wondering if anyone else actually has.
>=20
> I would expect the above would work fine with strict source routing, but=20
> I'm not so sure about loose source routing unless the firewall was one=20
> of the defined jump points.
>=20
> For example, let's say I know you "trust" some IP address on the=20
> Internet and permit a greater level of access from it to one of your=20
> internal systems. I craft the following packet:
>=20
> source IP =3D mine
> Dest IP =3D "trusted" Internet host
> First byte of IP options =3D 83
> IP in options field =3D your internal server
>=20
> In this case none of the IPs are the firewalls so I'm not so sure=20
> accept_source_route would even be referenced. Does the kernel check the=20
> size of all IP headers and process the included options even if its not=20
> the destination IP? I would think it would not for efficiency, but then=20
> again it might to deal with things like option 7 (record route).
>=20
> Has anyone tested this either way?
>=20
I suppose the easy answer is to check the kernel source code.

> Thanks in advance!
> Chris
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-0aqYFzI3KcwpVYbfd3z9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/cEySh1fuR/Bv+ygRAmorAKCKO2Ar9KKebcLmcNrGlY4d3m1cLACfZp50
XzOtOsK4xvLA1duumfUoTBw=
=3YiL
-----END PGP SIGNATURE-----

--=-0aqYFzI3KcwpVYbfd3z9--


