From: "Thomas J. Baker" <tjb@unh.edu>
Subject: Kernel 2.6.0-test5 and slow network xmits with ip_conntrack
Date: Fri, 26 Sep 2003 08:59:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064581165.10462.8.camel@wintermute.sr.unh.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-XQXOjYmIcMK8v4kUjYAE"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-XQXOjYmIcMK8v4kUjYAE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

It was suggested by davem@redhat.com that I report this problem here.

I'm running Red Hat's 2.6.x test kernels in RPM format and have a
problem with ip_conntrack. When it's installed, I get very slow
transmits in the range of 50KB/s on a 100Mb interface.=20

I currently using 2.6.0-0.test5.1.45smp. When transfering a 93MB file,
the first 2.5MB or so is transfered at about 50KB/s and then suddenly
the transfer speed increases to about 8MB/s. The total transfer time for
a 93MB file averages about 1 minute with ip_conntrack installed. The
time goes down to 11 seconds for the same transfer after removing it.

My bugilla report on this problem is here:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D101734

I'm not on this list so please CC me on any questions you have.

Thanks,

tjb
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| Thomas Baker                                  email: tjb@unh.edu    |
| Systems Programmer                                                  |
| Research Computing Center                     voice: (603) 862-4490 |
| University of New Hampshire                     fax: (603) 862-1761 |
| 332 Morse Hall                                                      |
| Durham, NH 03824 USA              http://wintermute.sr.unh.edu/~tjb |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


--=-XQXOjYmIcMK8v4kUjYAE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/dDgtoCtjjhzuY8QRAnGPAJ0f5Z6RVug/UxA+hOg4UC5SCmncSgCeOrc9
hAn93+hz2mZ6F9i7DncCzWM=
=1izn
-----END PGP SIGNATURE-----

--=-XQXOjYmIcMK8v4kUjYAE--

