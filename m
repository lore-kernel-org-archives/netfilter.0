From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Re-2: connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 14:20:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079094025.15566.90.camel@raylinux.internal>
References: <DIIE.000000F200002A31@sbgit.com>
	 <1079092896.2722.17.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-KaX4YSi4Rx0PYTLZM1po"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079092896.2722.17.camel@anduril.intranet.cartel-securite.net>
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


--=-KaX4YSi4Rx0PYTLZM1po
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-12 at 14:01, Cedric Blancher wrote:
> Le ven 12/03/2004 =E0 11:34, peter.gehle@sbgit.com a =E9crit : =20
> > > Micro$oft has a 'technote' on this in their technet section on the
> > > website. AFAIR you need to allow protocol 37 to be forwarded between =
the
> > > two.
> > I have added a rule that forwards the protocol 37, but it still not wor=
ks?
>=20
> PPTP relies on a slightly modified GRE tunnel, which protocol _47_, not
> 37.

Yup, you are correct. My mistake. I found the info at Technet in their
document entitled 'VPN servers and firewall configuration'

> cbr@anduril:~$ grep gre /etc/protocols
> gre     47      GRE             # General Routing Encapsulation
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-KaX4YSi4Rx0PYTLZM1po
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAUasJh1fuR/Bv+ygRArPoAJ9ZwXhmoAB9qYBNXI5ZfBnEoitNbgCdHJ0w
6Y8xU84kWgCugZW4e2rYR9E=
=OM6H
-----END PGP SIGNATURE-----

--=-KaX4YSi4Rx0PYTLZM1po--


