From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Destination NAT
Date: Thu, 29 Jan 2004 11:47:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075369661.1999.94.camel@raylinux.internal>
References: <147E1D375819F44680C3E5BFB6424C52DFC450@bcexc01.bue299.comafi.com.ar>
	 <200401290913.54045.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8UcBMsMCf96WvqbBgLZt"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401290913.54045.Antony@Soft-Solutions.co.uk>
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


--=-8UcBMsMCf96WvqbBgLZt
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-29 at 11:13, Antony Stone wrote:
> On Wednesday 28 January 2004 2:21 pm, Alejandro Zaidel wrote:
>=20
> > Can I address a packet to more than one IP address at the same time ??
> >
> > I have   iptables -t nat -A PREROUTING -i eth1 -j DNAT --to
> > 5.6.7.8-5.6.7.10  as an example, but I want to send the packets to both=
 7.8
> > and also 7.10
> >
> > Is it possible to do ???
>=20
> No.   You cannot use netfilter to create duplicates of packets.   Netfilt=
er=20
> will perform various operations on the packets which exit, but it won't m=
ake=20
> multiple versions of what was originally one packet.
>=20
With the exception of the MIRROR patch ...

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

--=-8UcBMsMCf96WvqbBgLZt
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAGNa9h1fuR/Bv+ygRAkZMAJ9aHNZOu+vKKOp0YnyxH68K9Ko8vACghEEr
zUz2D1DnPbKRxEDL9G5X/rs=
=R58X
-----END PGP SIGNATURE-----

--=-8UcBMsMCf96WvqbBgLZt--


