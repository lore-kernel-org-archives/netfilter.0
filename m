From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Strange entries in /var/log/messages
Date: Mon, 01 Mar 2004 14:50:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078145452.13370.23.camel@raylinux.internal>
References: <1078144018.13370.20.camel@raylinux.internal>
	 <200403011231.10861.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GZVFI5IC4YqsKUCjfvke"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403011231.10861.Antony@Soft-Solutions.co.uk>
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


--=-GZVFI5IC4YqsKUCjfvke
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-03-01 at 14:31, Antony Stone wrote:
> On Monday 01 March 2004 12:26 pm, Ray Leach wrote:
>=20
> > Hi All
> >
> > Can anyone explain why a machine on 10.0.0.10/24 would try and
> > communicate with another machine 10.0.0.4/24 via a router?
> > Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3D=
eth2
> > SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7 ID=3D17562 DF
> > PROTO=3DTCP SPT=3D4601 DPT=3D159 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
>=20
> Bad routing table / netmask on 10.0.0.10?
> Bad ARP cache entry?
> 10.0.0.4 sending silly ICMP redirects?
> Strange network cabling arrangement :) ?
>=20
Thanks for the pointers, checked all the above ...

Strange thing is that it (10.0.0.10) is communicating with 10.0.0.15
correctly (i.e. not via the router, but directly).

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

--=-GZVFI5IC4YqsKUCjfvke
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAQzGsh1fuR/Bv+ygRAt01AKCmplyvMfs/mZygGItEZSelSbJ3cACdG22a
Wiubhs1P2xUNC+LMTvK8P8U=
=k87S
-----END PGP SIGNATURE-----

--=-GZVFI5IC4YqsKUCjfvke--


