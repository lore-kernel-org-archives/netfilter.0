From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: ipt_IPV4OPTSSTRIP & Linux 2.6.14.4
Date: Fri, 23 Dec 2005 18:43:03 +0100
Message-ID: <20051223174303.GB31822@nightfall.luchs.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

I just tried patch-o-matic-ng with a new Linux kernel 2.6.14.4 in order
to try some of the extensions. The test system is a Debian Sarge 3.1r1,
the compiler is a GCC 3.4. During the build process the compiler aborts
with the following error:

[...]
  CC [M]  net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.o
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: In function `target':
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:33: warning: implicit declaration of=
 function `skb_ip_make_writable'
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: structure has no member n=
amed `nfcache'
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: `NFC_ALTERED' undeclared =
(first use in this function)
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: (Each undeclared identifi=
er is reported only once
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: for each function it appe=
ars in.)
make[3]: *** [net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

A short "grep skb_ip_make_writable net/ipv4/netfilter/*.c" shows that
skb_ip_make_writable() is only used in the IPV4OPTSSTRIP extension. Has
anyone else seen this error?

Best regards,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--m51xatjYGsM+13rf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDrDcneMu5lRpXJ7kRArsuAJ9AsSNVdwcb7fqhaLCPyPXo1hB5UwCgwy7p
xP2hRolj+jnFJfDwWJ+hx8U=
=j/gA
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--

