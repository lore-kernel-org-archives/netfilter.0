From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Re-8: connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 15:19:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079097542.15473.92.camel@raylinux.internal>
References: <DIIE.000000EE00002A43@sbgit.com>
	 <200403121306.04135.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-lAM2MQhSLzBLZ4D0R+VW"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403121306.04135.Antony@Soft-Solutions.co.uk>
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


--=-lAM2MQhSLzBLZ4D0R+VW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-12 at 15:06, Antony Stone wrote:
> On Friday 12 March 2004 1:00 pm, peter.gehle@sbgit.com wrote:
>=20
> > Ok, i have made an test, but in the syslog was nothing about the
> > connection? he logs nothing?
>=20
> So, maybe there's something about the protocol which simply doesn't work=20
> through nat without a special helper, or something like that?
>=20
No, I had it working to our Cape Town office using standard iptables
NAT. The key was fixed ips.=20

> As I said, I'm not an expert on PPTP, I just thought the logging rules mi=
ght=20
> give you a bit more information about what's going on.   If not, it's ove=
r to=20
> someone who knows how PPTP can be made to work....
>=20
> Regards,
>=20
> Antony.
>=20
> > -------- Original Message --------
> > Subject: Re: Re-6: connection to vpn Server (pptp) behind iptables FW
> > (12-Mrz-2004 13:28) From:    Antony@Soft-Solutions.co.uk
> > To:      peter.gehle@sbgit.com
> >
> > > On Friday 12 March 2004 12:24 pm, peter.gehle@sbgit.com wrote:
> > > > > It may be dynamic, but you can still find out what it is for a gi=
ven
> > > > > session.
> > > >
> > > > How?
> > >
> > > If it's a Linux machine, ifconfig
> > > If it's a Win9x machine, winipcfg
> > > If it's a WinXP machine, ipconfig
> > > If it's something else, I don't know.
> > >
> > > Antony.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-lAM2MQhSLzBLZ4D0R+VW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAUbjGh1fuR/Bv+ygRAt2nAJ9i01hovRLAjRQoM09QVZ9CN/6XewCgqhOm
hwAVz58XRKv2K1lt8bo3/co=
=2sc2
-----END PGP SIGNATURE-----

--=-lAM2MQhSLzBLZ4D0R+VW--


