From: hanxin <hanxin@mail.sc.cninfo.net>
Subject: Re: Problem loading ip_tables
Date: 14 Feb 2003 10:12:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045188778.471.4.camel@mobile_benny>
References: <200302132151.h1DLpff02343@alegre.cipic.ucdavis.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-W9ucEBbv8GwsFR1lgAtf"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302132151.h1DLpff02343@alegre.cipic.ucdavis.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Cc: netfilter <netfilter@lists.netfilter.org>


--=-W9ucEBbv8GwsFR1lgAtf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Have you "make modules_install" when compile kernel?
=E5=9C=A8 2003-02-14 =E4=BA=94 =E7=9A=84 05:51=EF=BC=8C Zhi-Wei Lu =E5=86=
=99=E9=81=93=EF=BC=9A
> Dear Netfilter/iptables guru,
>=20
> On a Raidzone OpenNas box, I compiled the kernel (generic 2.4.18 based ke=
rnel from=20
> Raidzone) with netfilter enabled and all iptables stuffs in modules.
>=20
> However, the kernel fail to load iptables.
>=20
> Here are some of the error messags:
>=20
> Flushing all current rules and user defined chains: /lib/modules/2.4.18-i=
37smp/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol nf_unregiste=
r_sockopt
> /lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: unresol=
ved symbol nf_register_sockopt
> /lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod =
/lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o failed
> /lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod =
ip_tables failed
> iptables v1.2.5: can't initialize iptables table `filter': iptables who? =
(do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>=20
> However, if I do a
>=20
> cat /proc/ksyms |grep nf_register_sockopt
>=20
> 802e79a0 nf_register_sockopt_R__ver_nf_register_sockopt
>=20
> Does anyone encounter similar problem before? =20
> Thank you.
>=20
> --=20
> Zhi-Wei Lu 	=09
> CIPIC (Center for Image Processing and Integrated Computing)
> UC Davis 	  	Phone:	(530)-752-0494
> Davis, CA 95616		Fax:   	(530)-752-8894
>=20
>=20
>=20
--=20

-hanxin


--=-W9ucEBbv8GwsFR1lgAtf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQA+TFCjyLEy9gLqsBsRAnmdAKCaNCUVDF+Iz61kPAqYK3E7S8Y7UgCglxfp
C83ygSwqN5kdaCrGz1wKHV4=
=cjy7
-----END PGP SIGNATURE-----

--=-W9ucEBbv8GwsFR1lgAtf--


