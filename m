From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: IPSEC using Linux Kernel 2.6
Date: Fri, 28 Oct 2005 06:07:02 -0600
Message-ID: <1130501222.2424.6.camel@davila.nicaraguaopensource.com>
References: <1130445253.3908.45.camel@wzowski.plastipak.com.sv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-CHVKbi7r5zPrG1zRFNzr"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1130445253.3908.45.camel@wzowski.plastipak.com.sv>
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
To: "Oscar A. Valdez" <oscar.valdez@duraflex-politex.com>
Cc: netfilter@lists.netfilter.org


--=-CHVKbi7r5zPrG1zRFNzr
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Oscar:

Why don't use iptables 1.3.3 and see if the policy match is present
after install the iptables 1.3.3 code into the kernel?

See the kernel options before install the patches ... some patches (as
the documentation said) are *not* compatibles.

Five patches from shorewall.net?=20

Why don't try:

kernel 2.6.12
iptables 1.3.3

After that, see If you still needs the patches (from patch-o-matic and
from shorewall.net)

Hope this helps,

Jorge.

El jue, 27-10-2005 a las 14:34 -0600, Oscar A. Valdez escribi=F3:
> I've been struggling to get IPSEC working on end-points on the same
> systems as Netfilter, and I'm amazed at how difficult it is to gather
> relevant information and to make it work on Linux, considering the
> growing deployment of IPSEC and the importance of Netfilter for
> firewalling. That's why I'm cross-posting to the netfilter users' and
> devels' lists.
>=20
> I believe the most reliable guide is at
> http://www.shorewall.net/IPSEC-2.6.html. Briefly, for my setup, the
> requirements are:
>=20
> Kernel 2.6.12 patched with:=20
>=20
>       * The five patches in
>         http://shorewall.net/pub/shorewall/contrib/IPSEC/2.6.12 (the
>         first four are the same as at
>         http://www.saout.de/misc/linux-2.6.12-ipsec-nat/ )
>=20
>       * The "policy match" extension from a recent Patch-o-matic-ng.
>=20
>       * iptables 1.3.0 patched with the "policy match" extension from a
>         recent Patch-o-matic-ng.
>=20
>       * ipsec-tools 0.5
>=20
> I first unpack a vanilla kernel and the iptables tarball into
> directories /tmp/linux-2.6.12.orig/ and /tmp/iptables-1.3.0.orig/, and
> make copies of both unpacked directories (/tmp/linux-2.6.12/
> and /tmp/iptables-1.3.0/)
>=20
> I then apply the "policy match" extensions to the copies, with the
> following patch-o-matic command:
>=20
> KERNEL_DIR=3D/tmp/linux-2.6.12/ \
> IPTABLES_DIR=3D/tmp/iptables-1.3.0/ ./runme extra
>=20
> Then, I generate the patch files by running=20
>=20
> diff -Nurp iptables-1.3.0.orig/ iptables-1.3.0/ \
> > ipsec-nf-policy-match.diff
>=20
> and
>=20
> diff -Nurp kernel-2.6.12.orig/ linux-2.6.12/ > ipsec-k-policy-match.diff
>=20
> When I try to compile the patched kernel, I get the following error:
>=20
> + make ARCH=3Di386 nonint_oldconfig
> CONFIG_IP_NF_MATCH_POLICY
> CONFIG_IP6_NF_MATCH_POLICY
> make[1]: *** [nonint_oldconfig] Error 2
> make: *** [nonint_oldconfig] Error 2
>=20
> It seems this is caused by the linux-2.4.0-nonintconfig.patch. I'll
> appreciate clues on how to get around this error, and I promise to keep
> the lists posted on my progress.
--=20
Jorge Isaac Davila Lopez

--=-CHVKbi7r5zPrG1zRFNzr
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDYhRmsLsR1MWg328RAle9AJ9hM4fKIQaERhx3Ltib9v8ICfKEegCfapUb
Ym4JOLcX5aQZVUoRk+tF8lA=
=Hp00
-----END PGP SIGNATURE-----

--=-CHVKbi7r5zPrG1zRFNzr--


