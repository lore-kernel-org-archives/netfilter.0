From: Marian Marinov <mm@yuhu.biz>
Subject: nf_ct_ftp: dropping packet
Date: Fri, 19 Mar 2010 13:09:57 +0200
Message-ID: <201003191310.02079.mm@yuhu.biz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1911213.tAqDy5D09m";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart1911213.tAqDy5D09m
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I'm working for a fairly large shared hosting provider. Recently we decided=
 to=20
upgrade the kernel of our servers to 2.6.33. However, during the testing ph=
ase=20
we started to see these messages in the logs:

Mar 18 07:52:26 serv01 kernel: nf_ct_ftp: dropping packetIN=3D OUT=3Deth0=20
SRC=3D212.212.212.12 DST=3D204.16.203.11 LEN=3D53 TOS=3D0x10 PREC=3D0x00 TT=
L=3D64 ID=3D21858=20
DF PROTO=3DTCP SPT=3D21 DPT=3D47282 SEQ=3D1836474396 ACK=3D1448911219 WINDO=
W=3D23 RES=3D0x00=20
ACK PSH FIN URGP=3D0

We don't have iptables LOG rules, this is generated directly from the kerne=
l.

212.212... is not a real IP I have substituted it.

Our kernel is 2.6.33 with GRsecurity patch.

We don't have any problems with the ftp service, however the messages in th=
e=20
log files are annoying.=20

Can someone tell me what can cause those?=20

My current thoughts are to remove the printk from the kernel. But is there =
a=20
better solution?

=2D-=20
Best regards,
Marian Marinov

--nextPart1911213.tAqDy5D09m
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkujW4oACgkQ4mt9JeIbjJS4ZACfWPhEnlgwwGLiMhmeQR9vJG3l
4ecAoI480xDbGWQPBoF4pzvG5cl+NIlh
=bLI3
-----END PGP SIGNATURE-----

--nextPart1911213.tAqDy5D09m--
