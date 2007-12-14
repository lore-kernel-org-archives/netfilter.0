From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: iptables v1.3.5: Couldn't load target `MASQUERADE':File not
	found
Date: Fri, 14 Dec 2007 13:06:38 -0600
Message-ID: <1197659198.19486.195.camel@grateful.d.umn.edu>
References: <200712131602.04744.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+lnUJ2pHn3a61yCOMESX"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200712131602.04744.schane@osmozis.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Saravanan Chanemouganandam <schane@osmozis.com>
Cc: netfilter@vger.kernel.org


--=-+lnUJ2pHn3a61yCOMESX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-12-13 at 16:02 +0100, Saravanan Chanemouganandam wrote:
> Hi all,=20
>=20
> Iam a newbie to use iptables and I am fascing the following issue with =20
> iptables v 1.3.5 on my target pxa270 Xscale running linux 2.6.16.

What distribution are you using? Finding answers for most of the
following problems will be dependent on this answer.


> schane:/sbin$ iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables v1.3.5: Couldn't load target `MASQUERADE':File not found
>=20
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> schane:/sbin$ iptables -A INPUT -i lo -j ACCEPT
> iptables v1.3.5: Couldn't load target `standard':File not found
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> I did google and mail archieve search but couldn't find the exact informa=
tion=20
> to fix the problem. To use iptables, I have enabled Core Netfilter=20
> Configuration, IP Netfilter Configuration built into linux-2.6.16 kernel=20
> image and cross compiled iptables package using buildroot's=20
> arm-linux-uclibc-gcc as=20
>=20
> make KERNEL_DIR=3D/home/pxa270/linux-2.6.16=20
> CC=3D/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-lin=
ux-gcc=20
> LD=3D/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-lin=
ux-ld
> BINDIR=3D/home/sara/BuildRoot/myrootfs/sbin=20
> LIBDIR=3D/home/sara/BuildRoot/myrootfs/lib install
>=20
> I have also built the netfilter configuration as kernel modules for the t=
est=20
> and lsmod shows the list of modules loaded , but still the problem persis=
ts.
> schane:~$ lsmod
> Module                  Size  Used by    Not tainted
> ipt_MASQUERADE          3296  0
> ipt_REJECT              4608  0
> ipt_owner               2016  0
> ipt_LOG                 6048  0
> iptable_nat             7300  0
> ip_nat                 15282  2 ipt_MASQUERADE,iptable_nat
> iptable_mangle          2400  0
> iptable_filter          2528  0
> ip_conntrack           51096  3 ipt_MASQUERADE,iptable_nat,ip_nat
> nfnetlink               5624  2 ip_nat,ip_conntrack
> ip_tables              11464  3 iptable_nat,iptable_mangle,iptable_filter
> x_tables               11172  6=20
> ipt_MASQUERADE,ipt_REJECT,ipt_owner,ipt_LOG,iptable_nat,ip_tables
>=20
> Can anybody tell me where it went wrong ?=20
>=20
> Thanks
> Sara
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-+lnUJ2pHn3a61yCOMESX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHYtQ+U+eIf4TiLaIRAsqNAJ9WkphcfkrmZ+l9B+MXchTlDUs6pgCghcKM
hZxqDSyatZbwK+E81tfjRMM=
=HmHW
-----END PGP SIGNATURE-----

--=-+lnUJ2pHn3a61yCOMESX--

