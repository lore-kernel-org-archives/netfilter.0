From: Harald Welte <laforge@netfilter.org>
Subject: Re: ip_nat_ftp on debian 2.4.20
Date: Tue, 15 Jul 2003 17:23:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715152354.GM7198@naboo>
References: <00f901c349bb$a8722230$1304a8c0@morggin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDymnuGqqhW10CwH"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00f901c349bb$a8722230$1304a8c0@morggin>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Bill Jameson <bjameson1@qwest.net>
Cc: netfilter@lists.netfilter.org


--qDymnuGqqhW10CwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2003 at 08:54:42PM -0700, Bill Jameson wrote:
> Im using Kernel-Souce 2.4.20.deb ... have loaded modules ip_tables
> ip_conntrack iptable_nat ip_conntrack_ftp ... when i try to insmod
> ip_nat_ftp i get kernel error ASSERT ip_conntrack_core.c:625
> &ip_conntrack_lock not readlocked ... any idea how i can fix this ?

I don't know the debian source, but the official 2.4.20 linux kernel
source is broken with regard to connection tracking. please use 2.4.19
or (better) 2.4.21

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--qDymnuGqqhW10CwH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FByJXaXGVTD0i/8RAvNfAJ9nmJ5R+jim1bImdi3oSotPQXtUBQCgs/LC
O/xzo1ANG7NySny4wKaEm5U=
=sm84
-----END PGP SIGNATURE-----

--qDymnuGqqhW10CwH--

