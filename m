From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: New not syn issue
Date: 28 May 2003 14:26:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054124775.13296.135.camel@raylinux.internal>
References: <14C5057BC852D611BAC400E0299AA10F203D0D@MAILSERV>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LwABqABvbgGQ4Ws3E58L"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <14C5057BC852D611BAC400E0299AA10F203D0D@MAILSERV>
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


--=-LwABqABvbgGQ4Ws3E58L
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-05-28 at 14:17, MOUDARIR Mohamed wrote:
> Hello,
>=20
> I have an iptables firewall with tree NIC
>=20
> Eth0 net interface
>=20
> Eth1 dmz interface
>=20
> Eth2 lan interface ( private network A 170.150.0.0/16 )
>=20
> Recently I connect a seconde private network ( B 170.151.0.0/16 )
> (from another site with SDSL router) to my network A.
>=20
> There is no probleme with routing. I can ping B from A, and ping A
> from B.
>=20
> I can also access internet from B.
>=20
> =20
>=20
> But I can not access a share directory from B (170.151.1.11)like
> \\170.150.1.10\d$ in a NT server in A=20
>=20
> When I look into firewall log, I can see :
>=20
> New not syn:IN=3Deth2 OUT=3Deth2 SRC 170.150.1.10 DST=3D170.151.1.11 LEN=
=3D44
> TOS=3D0x00 TTL=3D127 ID=3D43023 PROTO=3DTCP SPT=3D139 DPT=3D1787
>=20
> WINDOW=3D8760 RES=3D0x00 ACK URGP=3D0
>=20
> =20
Maybe this is caused by a stray nat rule - the packets seems to be
coming from and going to eth2.

>=20
> I look into my iptables script, and I think the reason of this is this
> rules :
>=20
> iptables -N bad_tcp_packets
>=20
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
> --log-prefix "New not syn:"
>=20
> iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j
> DROP
>=20
> =20
>=20
> What is the solution.?
>=20
> Thaks.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-LwABqABvbgGQ4Ws3E58L
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1Krnh1fuR/Bv+ygRAg8qAKCeZ53rHNJHD+QUXF4PRnZsBinFkACggBL0
OW/+3Qe1hNgci/LgFLGFzuM=
=0xaT
-----END PGP SIGNATURE-----

--=-LwABqABvbgGQ4Ws3E58L--


