From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: lots of ACK/FIN filtering (DPT=80) at web server.
Date: 29 May 2003 07:25:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054185938.13730.183.camel@raylinux.internal>
References: <Sea1-F98nnh99RhOQmI000379a3@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-NjtTpN1SBsQrtAW39sdw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea1-F98nnh99RhOQmI000379a3@hotmail.com>
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


--=-NjtTpN1SBsQrtAW39sdw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there

On Wed, 2003-05-28 at 10:46, SB CH wrote:
> Hello, all.
>=20
> I have operated linux web server and executed iptables 1.2.8.
>=20
> and I have found so lots of logs like this ACK,FIN filtering.
> Surely, ACK-FIN is a connection closing step, so there is no problem for=20
> customers but I would like to know why this happens!!
> I guess that the timeout of the connection tracking related.
>=20
Those are 'broken' browsers that do not follow the http standard
properly.
>=20
> May 25 12:33:05 www kernel: IN=3Deth0 OUT=3D SRC=3D210.126.xxx.xx=20
> DST=3D211.10.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D3376 DF=
 PROTO=3DTCP=20
> SPT=3D3608 DPT=3D80 WINDOW=3D63520 RES=3D0x00 ACK FIN URGP=3D0
>=20
> Do you have any problems like me?
Yes

> and what's the problem and how can I solve this problem?
>=20
Stop using non-standards complient browsers. Sometimes changes to
standards are not 'enhancements'.

>=20
> Thanks in advance for your kind opinios!!
>=20
> _________________________________________________________________
> =ED=99=95=EC=9D=B8=ED=95=98=EC=9E=90. =EC=98=A4=EB=8A=98=EC=9D=98 =EC=9A=
=B4=EC=84=B8 =EB=AC=B4=EB=A3=8C =EC=82=AC=EC=A3=BC, =EA=B6=81=ED=95=A9, =EC=
=9E=91=EB=AA=85, =EC=A0=84=EC=83=9D =EA=B0=80=EC=9D=B4=EB=93=9C  =20
> http://www.msn.co.kr/fortune/default.asp =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-NjtTpN1SBsQrtAW39sdw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1ZnRh1fuR/Bv+ygRAm2RAJ9jPHn2qS9zlcrpv7u2YjsKU4PNBwCggjTl
5zWrwyG68aVx/NPUSKtI3vg=
=q557
-----END PGP SIGNATURE-----

--=-NjtTpN1SBsQrtAW39sdw--


