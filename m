From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: iptables compile trouble
Date: 06 Jun 2002 08:30:59 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023345060.4298.150.camel@billy.demon.nl>
References: <1023317998.912.30.camel@hoi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-frX4Fw11UVPNG4K9t+Yy"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023317998.912.30.camel@hoi>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.samba.org>
Cc: "L.Kremkow" <kremkow@polytomy.org>


--=-frX4Fw11UVPNG4K9t+Yy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tor, 2002-06-06 kl. 00:59 skrev Andras Kis-Szabo:

> The
> > ip6tables.c:502: `AI_CANONNAME' undeclared (first use in this function)
> > ip6tables.c:509: warning: implicit declaration of function `getaddrinfo=
'
> > ip6tables.c:527: warning: implicit declaration of function `freeaddrinf=
o'
> > ip6tables.c:540: `NI_MAXHOST' undeclared (first use in this function)
> are definied in the /usr/include/netdb.h, which is included.
> These definitions depend on the __USE_POSIX define. (-D__USE_POSIX)

In which case Leif would do best to have a look at his
glibc/glibc-developer version and install that which suits his compiler
best.

I switch between gcc3.04 (standard for most compiles, including kernels)
and gcc2.96 (Red Hat bastardization, should have been gcc2.95) and both
use the same /usr/include/netdb.h. This comes from glibc-devel-2.2.4-24,
a Red Hat update.

He should cut out the horrible workaround that I gave in my last post.

Best,

Tony

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-frX4Fw11UVPNG4K9t+Yy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/wGj99dgUTvnuYERAmgoAKCODm/QD9srEQtdgBgD6MXx18488wCgoxa+
bmcpyav194fmVn49qHaaISc=
=BXJQ
-----END PGP SIGNATURE-----

--=-frX4Fw11UVPNG4K9t+Yy--


