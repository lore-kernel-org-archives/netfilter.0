From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 15:26:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420132645.GA23569@zion.homelinux.com>
References: <OFCC294FDA.EB782326-ON65256E7C.002FB337@hss.hns.com> <20040420102929.GA6236@zion.homelinux.com> <009401c426d9$3e2a3a10$68892090@grouse>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <009401c426d9$3e2a3a10$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: aksingh@hss.hns.com, netfilter@lists.netfilter.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Howdy Jee,

On Tue, Apr 20, 2004 at 02:13:16PM +0100, Jee J.Z. told us:
> Hi,
>=20
> You can have a look at 'libnet' for injecting a new packet. I think it's
> good for packet construction. But I am not sure whether the newly generat=
ed
> packet can bypass a certain hook or not at this time.

I think those packets would traverse the hooks as it is completely new
injected into the networking stack. But it would probably be the same=20
with packet sockets (btw. maybe libnet uses packet socket and is just
a comfortable way for building the packets)

Sven

>=20
> Jee
>=20

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 15:23:25  up 2 days, 22:21,  1 user,  load average: 0.00, 0.02, 0.00

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhSUVo4FAdB2PneQRAgHPAJ935y7Ekq35Lc8XVoxrPRt0Nsb1hQCeOJBx
qgVFxLe64KDOPKS+nATBHPA=
=LNaV
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

