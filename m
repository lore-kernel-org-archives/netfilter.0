From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ipq_read timeout
Date: Wed, 19 May 2004 17:03:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040519150327.GA15463@zion.homelinux.com>
References: <OFC79DA874.FBF1FD24-ON65256E99.004B6AA3@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFC79DA874.FBF1FD24-ON65256E99.004B6AA3@hss.hns.com>
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


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Wed, May 19, 2004 at 07:24:50PM +0530, aksingh@hss.hns.com told us:
>=20
> Hi,
>=20
>      I installed iptables 1.2.9 from source, now if i do an lsmod i get t=
he
> module loaded as ip_tables.o but I suspect this is the ip_tables.o of
> iptables 1.2.7a which I had before(I removed iptables 1.2.7 package using
> rpm -e iptables), I have one iptables.o in the directory in which
> iptables1.2.9 src is installed but when i do insmod iptables.o it says :

you're confusing two things here: ip_tables.o is the iptables kernel
module whereas iptables.o is one of the object files created when
building the new iptables binary which you then execute in user land
to add/change rules.
The userspace part should be pretty independent from your kernel version.
In your last mail you told that you had installed iptables 1.2.1, now
you're writing your old version 1.2.7a. If your old version really was
1.2.1 and your kernel is as old as the iptables version, you probably
want to upgrade your kernel first :)

>=20
> iptables.o : can't find the kernel version this module was compiled for.
>=20

This happens when you try to insert an object file used for linking
your iptables binary into the kernel. Won't work :) the ip_tables.o
which is shown with lsmod should be quite ok for your running
kernel.


Sven

> So what should I do to correct this ?
>=20
> thanks
> Amit
>=20



--=20
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:57:13  up 5 days, 18:59,  1 user,  load average: 0.03, 0.11, 0.09

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAq3c+o4FAdB2PneQRAiRfAJ43w3MEGFSphCRT2xAdqF/WDYA9HACeN4b5
/huNPomFRniwd7vKMIFOBkQ=
=gaT8
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

