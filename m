From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [xtables-addons] Oops in SYSRQ, BUG: unable to handle kernel
 paging request at ffffffffa01a90e0
Date: Fri, 20 Jan 2012 18:14:22 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201201812130.29700@frira.zrqbmnf.qr>
References: <4F199ADB.5000204@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F199ADB.5000204@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org


On Friday 2012-01-20 17:48, Marcin Miros=C5=82aw wrote:

>Hi again!
>I've found bug in xt_SYSRQ (probably), when i add rule with sysrq,
>remove rule, unload module then add rule i'm getting Oops. Please look
>at this:
>
>2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.988131] Modules
>linked in: sha1_generic compat_xtables ip6_tables zram(C) iptable_filt=
er
>ip_tables sit tunnel4 xfs exportfs dm_mod ipv6 sr_mod 8139too evdev
>cdrom 8139cp [last unloaded: xt_SYSRQ]
>2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
>2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] Pid:
>2388, comm: iptables Tainted: G         C  3.1.8-hardened #5 Xen HVM d=
omU

You have a crappy module (indicated by the "C") loaded, and since it's
zram, I don't know what effects that could have w.r.t. memory corruptio=
n.
Is this reproducible without zram?
