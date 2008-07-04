From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 4 Jul 2008 22:17:05 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807042215410.31959@fbirervta.pbzchgretzou.qr>
References: <486E42BD.7090609@zensoluciones.com> <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr> <486E75CB.7060301@zensoluciones.com> <alpine.LNX.1.10.0807042120040.31959@fbirervta.pbzchgretzou.qr> <486E7A02.20107@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486E7A02.20107@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?S=C2=8E=C3=A9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-07-04 21:29, S?=C3=A9bastien Cramatte wrote:

> This what I've done but ...
>
> I can't compile xtables-addons with a 2.6.25.10 kernel
> I get the latest sources from git  and  my setup my kernel before to =
include
> CONFIG_NF_CONNTRACK modules and dependencies.

You can select what modules to build (or not) by editing
the 'mconfig' file in the xtables-addons directory.
Either you enable said options in the kernel, or disable LOGMARK
in mconfig.
Note however that some modules duly require NF_CONNTRACK.
