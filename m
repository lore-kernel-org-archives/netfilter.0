From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Strange entries in /var/log/messages
Date: Mon, 01 Mar 2004 14:26:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078144018.13370.20.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Pj4rAYWFVHtllTchcapo"
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


--=-Pj4rAYWFVHtllTchcapo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi All

Can anyone explain why a machine on 10.0.0.10/24 would try and
communicate with another machine 10.0.0.4/24 via a router?
Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth2
SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D17562 DF
PROTO=3DTCP SPT=3D4601 DPT=3D159 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth2
SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D17563 DF
PROTO=3DTCP SPT=3D4602 DPT=3D158 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
Mar  1 14:19:40 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Deth2
SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D17593 DF
PROTO=3DTCP SPT=3D4601 DPT=3D159 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0

What is this? Port 158 and 159 apparently belong to
BackupExec/NetBackup. 10.0.0.10 is our backup server, but why does it
try and talk to 10.0.0.4 via the default router?



--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Pj4rAYWFVHtllTchcapo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAQywSh1fuR/Bv+ygRAiE9AJ9U6ibpjPvYPfuIqNvsJjzMaj/URwCcDnj0
N8qDEp/B7ZHgdjDVzwYdrUg=
=Mjtj
-----END PGP SIGNATURE-----

--=-Pj4rAYWFVHtllTchcapo--


