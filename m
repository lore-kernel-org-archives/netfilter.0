From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Bypass transparent proxy(Squid)
Date: Thu, 01 Apr 2004 13:16:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080818161.1288.25.camel@raylinux.internal>
References: <040EAEDD7A465C4AA0350CB69A326D550C3943@backup2.GODO-2000>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-SSpRioe0zguUCyCkU/fo"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <040EAEDD7A465C4AA0350CB69A326D550C3943@backup2.GODO-2000>
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


--=-SSpRioe0zguUCyCkU/fo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-04-01 at 13:04, Jerry Robles de Medina wrote:
> Thanks Anthony,
> Have you done this already in a situation?
> I'll try it out and let the list know how it went.
> Jerry
>=20
I have done this, and it works.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org [mailto:netfilter-admin@lists.n=
etfilter.org] On Behalf Of Antony Stone
> Sent: March 31, 2004 4:23 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Bypass transparent proxy(Squid)
>=20
> On Wednesday 31 March 2004 7:29 pm, Jerry Robles de Medina wrote:
>=20
> > Dear all,
> > I have read somewhere along the posts that it is possible to let 2 pc's
> > (ip's) bypass a transparent proxy server(squid cache). I have tried it =
in
> > the rc.firewall.up file but I cannot get it working. Can someone please
> > shed some light into my problem?I know it has to do with iptables but d=
unno
> > where and how.
>=20
> The trick is to create a user-defined chain, match the addresses you want=
 as=20
> exceptions, then do the NAT at the end of the chain (after the exceptions=
=20
> have been returned to the main chain).
>=20
> Something like:
>=20
> iptables -N mychain
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j mychain
> iptables -A mychain -t nat -s a.b.c.d -j RETURN
> iptables -A mychain -t nat -s w.x.y.z -j RETURN
> iptables -A mychain -t nat -j DNAT --to my.squid.proxy.server:3128
>=20
> The way this works is:
> 1. Only packets addressed to port 80 get processed by the user defined ch=
ain
> 2. The first exception source address a.b.c.d immediately returns (unchan=
ged)=20
> the to main PREROUTING chain.
> 3. The second exception address w.x.y.z returns to the main PREROUTING ch=
ain.
> 4. Any other addresses get redirected.
>=20
> I'm sure you can adjust this to your own requirements now you see the tri=
ck=20
> involved.   The important point is to recognise that the negation operato=
r !=20
> cannot deal with more than one exception address, so there's no point try=
ing=20
> to force it to work.
>=20
> Regards,
>=20
> Antony.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-SSpRioe0zguUCyCkU/fo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAa/nxh1fuR/Bv+ygRAibVAJ9npSE7QJXo1D3tAIT+c63pVin0PACgr8ym
ux1tIva1ck3YVCx5B9XdSco=
=O0Tf
-----END PGP SIGNATURE-----

--=-SSpRioe0zguUCyCkU/fo--


