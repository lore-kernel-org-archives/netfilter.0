From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: time module (PATCH)
Date: Wed, 14 Mar 2007 18:40:24 +0100
Message-ID: <20070314184024.0d7814e1.mailinglists@lucassen.org>
References: <20070313101604.6db3dc22.mailinglists@lucassen.org>
	<Pine.LNX.4.61.0703140310560.20730@yvahk01.tjqt.qr>
	<20070314111132.0fe3ad6c.mailinglists@lucassen.org>
	<Pine.LNX.4.61.0703141736400.1199@yvahk01.tjqt.qr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703141736400.1199@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 14 Mar 2007 17:37:51 +0100 (MET)
Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:

> Apply this on top (and perhaps forward it).
>=20
> Signed-off-by: Jan Engelhardt <jengelh@gmx.de>
>=20
> Index: linux/net/ipv4/netfilter/ipt_time.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/net/ipv4/netfilter/ipt_time.c
> +++ linux/net/ipv4/netfilter/ipt_time.c
> @@ -97,7 +97,6 @@ checkentry(const char *tablename,
>              const struct xt_match *match,
>  #endif
>             void *matchinfo,
> -           unsigned int matchsize,
>             unsigned int hook_mask)
>  {
>  	struct ipt_time_info *info =3D matchinfo;   /* match info for rule
>  	*/
> #<EOF>
>=20
> I did not actually run into the named stamp thing.

I'm sorry Jan....

$ patch -p0 < linux/net/ipv4/netfilter/patch=20
patching file linux/net/ipv4/netfilter/ipt_time.c
Hunk #1 succeeded at 92 with fuzz 2 (offset -5 lines).


[..]
CC [M]  net/ipv4/netfilter/ipt_time.o
net/ipv4/netfilter/ipt_time.c: In function ___match___:
net/ipv4/netfilter/ipt_time.c:69: error: ___const struct sk_buff___ has no
member named___stamp___
net/ipv4/netfilter/ipt_time.c: In function ___checkentry___:
net/ipv4/netfilter/ipt_time.c:113: error: ___matchsize___ undeclared
(first use in this function)
net/ipv4/netfilter/ipt_time.c:113: error: (Each undeclared identifier is
reported only once
net/ipv4/netfilter/ipt_time.c:113: error: for each function it appears
in.) net/ipv4/netfilter/ipt_time.c: At top level:
net/ipv4/netfilter/ipt_time.c:127: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_time.c:127: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_time.c:127: warning: initialization from
incompatible poi nter type
make[4]: *** [net/ipv4/netfilter/ipt_time.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: Leaving directory `/usr/src/linux-2.6.20.3'
make: *** [debian/stamp-build-kernel] Error 2


--=20
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

