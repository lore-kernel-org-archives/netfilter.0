From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Strange traffic from a user ...
Date: Thu, 05 Feb 2004 10:44:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075970665.5355.5.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-sMcsVdkiO1YkEVpezULw"
Return-path: <netfilter-admin@lists.netfilter.org>
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


--=-sMcsVdkiO1YkEVpezULw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all

Can someone tell me what this is?

Feb  5 10:26:10 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.26.4.32 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127=
 ID=3D32898
DF PROTO=3DTCP SPT=3D1745 DPT=3D3022 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
Feb  5 10:26:11 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.170.20.10 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27
ID=3D33629 DF PROTO=3DTCP SPT=3D1788 DPT=3D1915 WINDOW=3D64240 RES=3D0x00 S=
YN URGP=3D0
Feb  5 10:26:12 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.92.38.155 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27
ID=3D34070 DF PROTO=3DTCP SPT=3D1780 DPT=3D2034 WINDOW=3D64240 RES=3D0x00 S=
YN URGP=3D0
Feb  5 10:26:12 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.168.165.204 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=
=3D127
ID=3D34071 DF PROTO=3DTCP SPT=3D1781 DPT=3D3169 WINDOW=3D64240 RES=3D0x00 S=
YN URGP=3D0
Feb  5 10:26:12 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.47.6.119 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7
ID=3D34072 DF PROTO=3DTCP SPT=3D1783 DPT=3D3595 WINDOW=3D64240 RES=3D0x00 S=
YN URGP=3D0
Feb  5 10:26:12 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth0
SRC=3D10.0.0.122 DST=3D24.128.32.100 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D=
127
ID=3D34412 DF PROTO=3DTCP SPT=3D1764 DPT=3D2962 WINDOW=3D64240 RES=3D0x00 S=
YN URGP=3D0

The destinations appear to be dialup ip addresses. Maybe a worm or
spyware?

Regards

Ray

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-sMcsVdkiO1YkEVpezULw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAIgJph1fuR/Bv+ygRAomZAKCyWMlnUs5Mnfv5MumeSrliNl6CJQCfbSLQ
Vn5QWnD3Ygc1BA3pVqa2pqU=
=k5xo
-----END PGP SIGNATURE-----

--=-sMcsVdkiO1YkEVpezULw--


