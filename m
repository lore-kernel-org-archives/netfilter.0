From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: registering/unregistering hook functions
Date: Thu, 3 Jun 2004 15:58:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040603135826.GA15047@zion.homelinux.com>
References: <OF87054433.768E32DF-ON65256EA8.00499678@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF87054433.768E32DF-ON65256EA8.00499678@hss.hns.com>
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
Cc: netfilter@lists.netfilter.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Thu, Jun 03, 2004 at 07:01:22PM +0530, aksingh@hss.hns.com told us:
>=20
> Hi,
>=20
>   In my module I do not want my hook functions to start capturing packets
> when it is inserted using insmod(i.e i do not want my hook registration
> functions to be called in init_module(). I want to register them when
> someone writes onto my char device, so then I cannot unregister my hook
> functions in the cleanup_module() because I do not know if they are
> registered or not in the first place.
>=20
>    So my question is, is there a way to find out before calling the
>    unregister functions in cleanup_module whether or not they are
>    registered. Something like this in the cleanup module :
>    cleanup_module()
>       if (registered(nfho1)) unregister(nfho1) ;
>=20

I don't know if there's a function to find out if a particular function
is registered with the netfilter hooks. But the simplest method to
accomplish what you want would be to have a variable in your module
which is initialized to 0 and when you register set it to 1. Then, in
your cleanup_module(), only unregister iff the variable is set to 1.
Don't know if there's a better way to do it.


HTH

Sven

> ??
>=20
> thanks
> Amit

--=20
Linux zion 2.6.7-rc2 #2 Mon May 31 22:58:01 CEST 2004 i686 athlon i386 GNU/=
Linux
 15:55:33  up 2 days, 16:55,  3 users,  load average: 0.14, 0.05, 0.01

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAvy6Co4FAdB2PneQRAhTWAJ4ty4p/4QgoXu+z42Kp6eaPB0xC6QCePb6I
0MUvB3bR45EDeO/8D9oRdg4=
=mOiz
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

