From: Alexander Samad <alex@samad.com.au>
Subject: Re: netfilter digest, Vol 1 #1942 - 8 msgs
Date: Wed, 7 Jul 2004 17:22:14 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040707072214.GI22729@samad.com.au>
References: <20040706214011.26343.22595.Mailman@vishnu.netfilter.org> <Pine.LNX.4.58L0.0407070907140.8585@debian.telesat.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58L0.0407070907140.8585@debian.telesat.eu.org>
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


--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Have a look in the netfilter-dev mailist there is a patch to fix this

sorry can't remember of the top of my head!

Alex

On Wed, Jul 07, 2004 at 09:13:20AM +0200, Tomasz Czapiewski wrote:
> I've got exactly the same problem with Mandrake Cooker 2.6.7-rc3,
> 2.6.7-1 and 2.6.7-2 kernels.
> I've tried both iptables 1.2.10 and 1.2.11 - the problem stil exists.
> I get binary iptables 1.2.10 compiled on debian with 2.6.7 kernel and it
> works, but I still can't use 'nat' (SNAT/DNAT/MASQUERADE).
>=20
> Can someone point me how to get rid of this (using the same kernel) - or
> give me any patch for that to even vanilla kernel 2.6.7?
>=20
> --
> xeros
>=20
>=20
> > --__--__--
> >
> > Message: 6
> > Reply-To: "Eric Poulin" <epoulin@onepost.net>
> > From: "Eric Poulin" <epoulin@onepost.net>
> > To: <netfilter@lists.netfilter.org>
> > Subject: Problem compiling Iptables 1.2.11 on Kernel 2.6.7
> > Date: Tue, 6 Jul 2004 15:28:53 -0400
> >
> > Hello Guys,
> >
> > Any people succesfully compiled iptables 1.2.11 on 2.6.7?  Oddly, even
> > without applying any patch-o-matics packages, I'm getting the following
> > error while doing the make:
> >
> > # make BINDIR=3D/sbin KERNEL_DIR=3D/usr/src/linux
> > Making dependencies: please wait...
> > Extensions found: IPv4:ROUTE IPv4:recent IPv6:ROUTE IPv6:ah IPv6:esp
> > IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
> > gcc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_V=
ERSIO
> > N=3D\"1.2.11\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt=
_ah.c
> > In file included from include/libiptc/libiptc.h:6,
> >                  from include/iptables.h:5,
> >                  from extensions/libipt_ah.c:8:
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: warning: no
> > semicolon at end of struct or union
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: error: syn=
tax
> > error before '*' token
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:259: error: syn=
tax
> > error before '}' token
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: t=
ype
> > defaults to `int' in declaration of `DECLARE_MUTEX'
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
> > parameter names (without types) in function declaration
> > /usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
> > `DECLARE_MUTEX' declared `static' but never defined
> > make: *** [extensions/libipt_ah_sh.o] Error 1
> >
> >
> > I'm getting this with a vanilla source code of the kernel and iptables.=
 I
> > was getting those with the patch-o-matic installed, but I wanted to nar=
row
> > it down. Kernel can compile easily those modules that are coming from
> > iptables 1.2.9.
> >
> > Any idea?
> >
> > Eric
>=20
>=20

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA66SmkZz88chpJ2MRAq0EAJ9xZnptqz4+6Qtj13N/YjwjtBkiUwCeIVdG
DAgIwu2MzLIAjaOPiM0YL0A=
=vn4R
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--

