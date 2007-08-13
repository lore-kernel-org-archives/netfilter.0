From: "Nesser, Phil" <nesser@amazon.com>
Subject: rule limit question
Date: Mon, 13 Aug 2007 15:52:22 -0700
Message-ID: <4D25F22093241741BC1D0EEBC2DBB1DA365FFC74@EX-SEA5-D.ant.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Language: en-US
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

For relatively obscure reasons, I am trying to build a set of rules that ru=
n into the hundreds of thousands.  I was experimenting on a Redhat Release =
5 machine with 2.6.18 kernel and 1.3.5  iptables.  I was able to load aroun=
d 340k rules before getting an error of iptables-restore: line XXXXXX faile=
d.

So I try it out on a server (much beefier, 8G ram, dual quad core 2GHz proc=
) running the same kernel/iptables versions.  This time it died in the same=
 way at about 40k rules.  After some research I found a log message on Vmal=
loc failures, so I figured what the hell and rebuilt the server using the 6=
4 bit version of RH 5.  Now no more vmalloc failures, but still dies at aro=
und 40k entries.

I am more than happy to build a custom kernel if that what I need to do.  I=
 have poked around the sources and it is not obvious what needs to change.

Any help would be appreciated.

Thanks!

- --->  Phil
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (MingW32)

iD8DBQFGwOCma2RfHGe2XK4RAtP8AJ4n0b6GrDHtrWJtHJO+4HXj+mDzhQCeNuBZ
focPiQFfyved9SKA/ZmAoqM=3D
=3DGETn
-----END PGP SIGNATURE-----

