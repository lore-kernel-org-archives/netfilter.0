From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: PATCHES AGAIN...
Date: Thu, 27 Mar 2008 12:10:21 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803271148040.22661@fbirervta.pbzchgretzou.qr>
References: <47EB4AC7.5040202@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EB4AC7.5040202@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Thursday 2008-03-27 08:20, G=E1sp=E1r Lajos wrote:

> Hi list!
>
> I have a "few" patches against the following setup:
>
> Kernel: 2.6.24.4
> iptables: 7424 svn
> ipset: 7424 svn
> patch-o-matic-ng: 7424 svn
> chaostables: 66 svn
> gcc: 4.3.1 20080309
>
> "Changelog:"
> patch-o-matic: recognise the latest iptables svn
> iptables: remove the compiling warnings ( { .name =3D NULL } )
> pom-patches: repair incompatible type warnings
> etc. .... :-D
>
> WorksForMe TM :D
>
> To Jan Engelhardt:
>
> I have seen a v0.8 version of your chaostables, but it is not include=
d in the=20
> svn.
> Would you update the repository?
>
> Swifty
>
>

    2      79 lines   Text/X-DIFF (Name: "ip6tables.c.patch")
    3      35 lines   Text/X-DIFF (Name: "ip6tables-restore.c.patch")
    4      20 lines   Text/X-DIFF (Name: "ip6tables-save.c.patch")
    13     83 lines   Text/X-DIFF (Name: "iptables.c.patch")
    14     37 lines   Text/X-DIFF (Name: "iptables-restore.c.patch")
    15     20 lines   Text/X-DIFF (Name: "iptables-save.c.patch")

I picked these up into my own stack (the unmerged one, remember) and=20
added the IPv4 parts after cleanup.

    5     130 lines   Text/X-DIFF (Name: "ipt_connlimit.c.patch")
    18     55 lines   Text/X-DIFF (Name: "libipt_connlimit.c.patch")
    11    137 lines   Text/X-DIFF (Name: "ipt_time.c.patch")
    12     39 lines   Text/X-DIFF (Name: "ipt_u32.c.patch")
    27     37 lines   Text/X-DIFF (Name: "libipt_TARPIT.c.patch")
    28    132 lines   Text/X-DIFF (Name: "libipt_time.c.patch")
    29     45 lines   Text/X-DIFF (Name: "libipt_u32.c.patch")

These modules are all already in mainline.


    6     121 lines   Text/X-DIFF (Name: "ipt_ipp2p.c.patch")
    20     93 lines   Text/X-DIFF (Name: "libipt_ipp2p.c.patch")

I currently have ipp2p evaluated for Xtables-addons (xt-a) inclusion=20
already.

    9     197 lines   Text/X-DIFF (Name: "ipt_ROUTE.c.patch")
    23     61 lines   Text/X-DIFF (Name: "libipt_ROUTE.c.patch")
    16     70 lines   Text/X-DIFF (Name: "libip6t_ROUTE.c.patch")

ROUTE has been deleted. Not technically (as it seems), but in
people's minds it is already gone since it is replaced by MARK and
TEE (xt-a).

    10    165 lines   Text/X-DIFF (Name: "ipt_TARPIT.c.patch")
    32     20 lines   Text/X-DIFF (Name: "libxt_geoip.c.patch")

xt_TARPIT and xt_geoip are in xt-a.

    19     73 lines   Text/X-DIFF (Name: "libipt_IPMARK.c.patch")

xt_IPMARK is projected for xt-a.

    31     16 lines   Text/X-DIFF (Name: "libxt_CHAOS.c.patch")
    33     38 lines   Text/X-DIFF (Name: "libxt_portscan.c.patch")
    38     52 lines   Text/X-DIFF (Name: "xt_CHAOS.c.patch")
    39     29 lines   Text/X-DIFF (Name: "xt_DELUDE.c.patch")
    40     42 lines   Text/X-DIFF (Name: "xt_portscan.c.patch")

Chaostables is in xtables-addons (git) now;
(on a side note, the patches are not against the latest
chaostables-svn version either).


Just in case you are interested, urls are
git://dev.computergmbh.de/xtables and
git://dev.computergmbh.de/xtables-addons .
