From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ipq_read timeout
Date: Thu, 20 May 2004 16:11:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040520141122.GA31586@zion.homelinux.com>
References: <OF7590A685.8176A82D-ON65256E9A.000E5E1F@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF7590A685.8176A82D-ON65256E9A.000E5E1F@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Thu, May 20, 2004 at 08:17:06AM +0530, aksingh@hss.hns.com told us:
>=20
> HI Sven,
>=20
>    Well 1.2.1 was on a different system , that had linux 2.4.2, ip_tables
> 1.2.7a was on a system that has 2.4.20-8. Ok fine, that means I got it
> terribly wrong ;-) . So iptables.o is the object file I get after compili=
ng
> iptables.c from source. And after every make, make install the kernel
> module ip_tables.o is automatically put in the directory
> /lib/modules/2.x.x/kernel/net/ipv4/netfilter/ip_tables.o. This happens ev=
en
> if I had a different ip_tables version installed earlier ? i.e the earlier
> version is overwritten ?. Also, the reason why I got this doubt is :
> 1) I erased the ip_tables rpm after I installed from source
> 2) ls -la on /lib/modules/2.x.x/kernel/net/ipv4/netfilter/ip_tables.o sho=
ws
> me march 14, whereas for all object files in the source directory where I
> untarred the iptables 1.2.9 source show me may 19th  i.e yesterday. So is
> this kernel module not made while doing a make ?

The ip_tables.o is made when you compile your kernel and is copied
to the /lib/modules/2.x.x/kernel/net/ipv4/netfilter directory when
you issue make modules_install from your kernel source directory
(or when you install the kernel RPM). Each time you recompile the
kernel and do the make modules_install the old ip_tables.o is
replaced by the newly compiled.


Sven

>=20
> thanks
> Amit
>=20

--=20
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:07:51  up 6 days, 18:10,  1 user,  load average: 0.04, 0.04, 0.02

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFArLyKo4FAdB2PneQRAl0mAJ4mWAw+EZ3iIWrs5Wusv25bldq0jACeNmr6
cYux2Vvp8d6Lxcd8kZ4+UcI=
=8Mje
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

