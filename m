From: "Carl Farrington" <carl@compsup.net>
Subject: RE: p.o.m-ng+linux-2.6.2+ctnetlink
Date: Thu, 19 Feb 2004 17:01:52 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC0165A5@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Well it looks like patch-o-matic-ng doesn't support 2.6 yet. I find it
very confusing. The only information I found on kernel 2.6 was a very
short "News" from December 2003 which said "expect a patch-o-matic-ng
which will support 2.6". Which led me to think NG would work on 2.6 but
alas not yet.

> -----Original Message-----
> From: T. Horsnell (tsh) [mailto:tsh@mrc-lmb.cam.ac.uk]
> Sent: 19 February 2004 15:41
> To: netfilter@lists.netfilter.org
> Subject: p.o.m-ng+linux-2.6.2+ctnetlink
>=20
> Problem using patch-o-matic-ng-20040217 to patch kernel 2.6.2
> and iptables-1.2.9, to include the nfnetlink-ctnetlink-0.13 patch.
>=20
> When I use .runme to test this patch, it reports:
> 'Patch nfnetlink-ctnetlink-0.13 applies cleanly'
> When I actually install the patch, it reports errors,
> but installs it anyway.
>=20
> Re-make of the kernel then fails:
>=20
> [root@dev1 linux-2.6.2]# make bzImage
>   HOSTCC  scripts/modpost.o
>   HOSTLD  scripts/modpost
> make[2]: `scripts/fixdep' is up to date.
> scripts/kconfig/conf -s arch/i386/Kconfig
> net/ipv4/netfilter/Kconfig:593: syntax error, unexpected T_WORD
> net/ipv4/netfilter/Kconfig:595: invalid menu option
> make[2]: *** [silentoldconfig] Error 1
> make[1]: *** [silentoldconfig] Error 2
> make: *** [include/linux/autoconf.h] Error 2
>=20
> Any advice?
>=20
> Cheers,
> Terry.
>=20
>=20
>=20
>=20
>=20
>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D
> Welcome to Patch-o-matic (1.11)!
>=20
> Kernel:         /usr/src/linux-2.6.2
> Iptables:       /usr/src/iptables
>=20
> Each patch is a new feature: many have minimal impact, some do not.
> Almost every one has bugs, so don't apply what you don't need!
> -------------------------------------------------------
> Already applied:
>=20
> Testing nfnetlink-ctnetlink-0.13... not applied
> The nfnetlink-ctnetlink-0.13 patch:
>    Author: Harald Welte <laforge@gnumonks.org>, Jay Schulist
> <jschlst@samba.org>,
>    Status: Under development, but stabilizing now.
>=20
>         Patrick McHardy <kaber@trash.net>
>=20
>    Add recent work by patrick (notifiers, event messages to userspace.
>=20
> -----------------------------------------------------------------
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] t
> Patch nfnetlink-ctnetlink-0.13 applies cleanly
> -----------------------------------------------------------------
> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
> ERROR (7 rejects out of 52 hunks)
>=20
> Excellent! Source trees are ready for compilation.
>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D
>=20
> Checking whether the patch was actually installed:
>=20
>=20
>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D
> Welcome to Patch-o-matic (1.11)!
>=20
> Kernel:         /usr/src/linux-2.6.2
> Iptables:       /usr/src/iptables
>=20
> Each patch is a new feature: many have minimal impact, some do not.
> Almost every one has bugs, so don't apply what you don't need!
> -------------------------------------------------------
> Already applied:
>=20
> Testing nfnetlink-ctnetlink-0.13... applied
>=20
> Excellent! Source trees are ready for compilation.
>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D
>=20


