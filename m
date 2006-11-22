From: Paul Reilly <paul@astropaul.com>
Subject: Re: What happened to ipt_physdev.c ?
Date: Wed, 22 Nov 2006 15:55:41 -0800
Message-ID: <1164239741.4564e37d888c2@mail.third-rock.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter@lists.netfilter.org, Andy Furniss <lists@andyfurniss.entadsl.com>


> > grep -i phy /boot/config-2.6.19-rc6
> > CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm

Yes, I can see it in 2.6.18.3 as well.
There's no longer an ipt_physdev.c in netfilter, so it must
be included in another c file.

However I need to use 2.6.16.2x and it seems to be either missing
or buggy in there. For example it's in Kconfig, but enabling
all the dependencies does not display it in menuconfig, and when
you output the .config it's not listed in there at all.

Paul

> if you have a kernel source tree, just pop into "make menuconfig" and
> do a search for any matching options:
>
> /physdev
>
> Symbol: NETFILTER_XT_MATCH_PHYSDEV [=3Dm]
> Prompt: "physdev" match support
>   Defined at net/netfilter/Kconfig:368
>   Depends on: NET && NETFILTER && NETFILTER_XTABLES && BRIDGE &&
>
> ... etc etc ...
>
> rday
>


--=20

