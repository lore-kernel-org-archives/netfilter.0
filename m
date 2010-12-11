From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 04:07:01 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012110326360.10546@obet.zrqbmnf.qr>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr> <4D02CDA1.6030408@googlemail.com> <4D02D510.9050700@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D02D510.9050700@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


On Saturday 2010-12-11 02:34, Mr Dash Four wrote:
>
> Further to the above: The 'problematic' line, which SHOULD be include=
d in
> libxt_gradm.c is:
> #include "compat_user.h" (it actually states in the header file
> "linux-glibc-devel 2.6.34 header screwup", so at least someone admits=
 to a
> screw up for once!)

The screwup is on behalf of a79ff731a1b277d0e92d9453bdf374e04cec717a.
Me, I am just adding workarounds to xt-a.

> With this however, the problems are NOT fixed, I am getting this furt=
her down
> the line:
>
> ipset_iphash.c: In function =E2=80=98iphash_create_init=E2=80=99:
> ipset_iphash.c:42: error: =E2=80=98IP_NF_SET_HASHSIZE=E2=80=99 undecl=
ared (first use in this
> function)

This is a different one, and not in 1.31, just git master -
and will be fixed soon.
