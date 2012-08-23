From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [xtables-addons] Oops in SYSRQ, BUG: unable to handle kernel
 paging request at ffffffffa01a90e0
Date: Thu, 23 Aug 2012 15:23:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208231520190.32157@frira.zrqbmnf.qr>
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

Maybe fixed with commit
commit cb8050172ae1d893f58c1aa57de975f9932dace6 (v1.44~4)
Author: Jan Engelhardt <jengelh@inai.de>
Date:   Wed Jul 11 01:42:39 2012 +0200

    SYSRQ: fix double target initialization at module load

