From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons-1.41, ipset build error with
 hardened-sources-3.2.2
Date: Sun, 22 Apr 2012 16:49:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204221647400.14663@frira.zrqbmnf.qr>
References: <4F25C692.2090004@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F25C692.2090004@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org


On Sunday 2012-01-29 23:22, Marcin Miros=C5=82aw wrote:

> /var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addons=
-1.41/extensions/ipset-6/pfxlen.c:148:1:
> warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=
=80=98EXPORT_SYMBOL_GPL=E2=80=99

This is probably because the file does not #include <linux/module.h>
(or <linux/export.h> as it has become); it is, however, no longer
an issue since ipset-6 is no longer included starting with 1.42.
