From: Marian Marinov <mm@yuhu.biz>
Subject: Re: nf_ct_ftp: dropping packet
Date: Fri, 19 Mar 2010 16:43:00 +0200
Message-ID: <201003191643.04191.mm@yuhu.biz>
References: <201003191310.02079.mm@yuhu.biz> <4BA38C1A.6050103@trash.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5507905.01olb2eHzD";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BA38C1A.6050103@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

--nextPart5507905.01olb2eHzD
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 19 March 2010 16:37:14 Patrick McHardy wrote:
> Marian Marinov wrote:
> > Hello,
> > I'm working for a fairly large shared hosting provider. Recently we
> > decided to upgrade the kernel of our servers to 2.6.33. However, during
> > the testing phase we started to see these messages in the logs:
> >
> > Mar 18 07:52:26 serv01 kernel: nf_ct_ftp: dropping packetIN=3D OUT=3Det=
h0
> > SRC=3D212.212.212.12 DST=3D204.16.203.11 LEN=3D53 TOS=3D0x10 PREC=3D0x0=
0 TTL=3D64
> > ID=3D21858 DF PROTO=3DTCP SPT=3D21 DPT=3D47282 SEQ=3D1836474396 ACK=3D1=
448911219
> > WINDOW=3D23 RES=3D0x00 ACK PSH FIN URGP=3D0
> >
> > We don't have iptables LOG rules, this is generated directly from the
> > kernel.
> >
> > 212.212... is not a real IP I have substituted it.
> >
> > Our kernel is 2.6.33 with GRsecurity patch.
> >
> > We don't have any problems with the ftp service, however the messages in
> > the log files are annoying.
> >
> > Can someone tell me what can cause those?
>=20
> The helper decided to drop a packet. This is usually cause by partial
> FTP command matches, which can't be handled.
>=20
> > My current thoughts are to remove the printk from the kernel. But is
> > there a better solution?
>=20
> If you don't use logging, unload the ipt_LOG module.

It is not loaded, and I still see those messages...=20
Here is the list of loaded modules:

root@milano175:~# lsmod
Module                  Size  Used by
ipv6                  233580  22
nf_nat_ftp              1356  0
nf_conntrack_ftp        4590  1 nf_nat_ftp
xt_length                868  1
xt_state                 974  52
xt_pkttype               720  4
xt_dscp                 1185  1
xt_multiport            1914  3
xt_owner                 786  6
ipt_REDIRECT             817  1
iptable_nat             2815  1
nf_nat                 13129  3 nf_nat_ftp,ipt_REDIRECT,iptable_nat
nf_conntrack_ipv4       8957  55 iptable_nat,nf_nat
nf_conntrack           53525  6=20
nf_nat_ftp,nf_conntrack_ftp,xt_state,iptable_nat,nf_nat,nf_conntrack_ipv4
nf_defrag_ipv4           965  1 nf_conntrack_ipv4
iptable_mangle          1365  0
iptable_raw              947  0
dm_mirror              10278  0
dm_region_hash          8145  1 dm_mirror
dm_log                  7119  2 dm_mirror,dm_region_hash
dm_multipath           12463  0
power_meter             7442  0
sr_mod                 10557  0
tg3                    97760  0
cdrom                  32827  1 sr_mod
iTCO_wdt                8164  0
i3200_edac              2574  0
iTCO_vendor_support     2251  1 iTCO_wdt
uhci_hcd               16215  0


>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

=2D-=20
Best regards,
Marian Marinov

--nextPart5507905.01olb2eHzD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkujjXgACgkQ4mt9JeIbjJRfxQCgpqm76m92Qo2/sNhpBz832bh+
FJ0AoMrHJulj01uOFYqpFa09dgFA/Zsi
=lVPd
-----END PGP SIGNATURE-----

--nextPart5507905.01olb2eHzD--
