From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: problems using FTOS extension
Date: Thu, 05 Feb 2004 09:30:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075966221.5360.2.camel@raylinux.internal>
References: <598558C21D078804AB348529E476E840@markcs.wildmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-3ELK/+UyMWmVRsxyT+mr"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <598558C21D078804AB348529E476E840@markcs.wildmail.com>
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


--=-3ELK/+UyMWmVRsxyT+mr
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-02-05 at 03:42, mark smith wrote:
> Hi all,
>=20
> I need to use the FTOS target. Took me quite a
> while to figure out how to get it 'available' for
> use. (I added 'FTOS' to the PF_EXT_SLI field of
> the Makefile in the extensions directory of the
> 1.2.9 distro and that seems to have done the
> trick. After running make and make install the
> libipt_FTOS.so file gets copied into
> /usr/local/lib/iptables).
>=20
> I'm having trouble using the correct syntax for a
> rule though. This rule,using TOS, works fine:
> iptables -I OUTPUT -t mangle -j TOS --set-tos 0x02
>=20
> Trying the same thing with FTOS:
> iptables -I OUTPUT -t mangle -j FTOS --set-ftos 0x02
> Produces the error message:
> iptables: No chain/target/match by that name
>=20
> Looks weird. Interestingly, if I don't provide
> the --set-ftos argument I get a logical error
> message:
> iptables v1.2.9: FTOS target: Parameter
> --set-ftos is required
> So it looks like FTOS can be used but I'm doing
> something wrong with the --set-ftos argument.
>=20
> I'm running a 2.4.20-8 kernel on RH9.
>=20
Don't you need to recompile your kernel, selecting the FTOS stuff?

> Thanks,
>=20
> Mark.
>=20
>=20
> &#8216;The ideals which have lighted my way,=20
> and time after time given me new=20
> courage=20
> to face life cheerfully, have=20
> been kindness, beauty, and truth. The=20
> trite subjects of life &#8211; possessions,=20
> outward success, luxury &#8211; have always=20
> seemed contemptible.&#8217;=20
>=20
> Albert Einstein
> ------------------
>=20
> Protect your right to breathe clean, smoke-free air:
> http://www.care2.com/go/z/11238/1043
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-3ELK/+UyMWmVRsxyT+mr
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAIfENh1fuR/Bv+ygRAvHoAJ9adVGgzYsuyCrRqrUtOaTA7bL2vACglTXR
HDhuxHuMEFL6uTulR5QjXoc=
=dUqb
-----END PGP SIGNATURE-----

--=-3ELK/+UyMWmVRsxyT+mr--


