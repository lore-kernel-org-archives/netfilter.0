From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: Re: xtables-addons-1.41, ipset build error with hardened-sources-3.2.2
Date: Tue, 24 Apr 2012 14:38:24 +0200
Message-ID: <4F969EC0.8030000@mejor.pl>
References: <4F25C692.2090004@mejor.pl> <alpine.LNX.2.01.1204221647400.14663@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=IpMuBVWCalHx5pkOQgSoLevZ8nfRBd197SWUgaLJsxI=;
	b=OoJdKydVeeK6Mdo/hmW70+duk78B5M892z9wbKssWQ1RYRPpr0T4w5CyAGc/zUDNUURGnI44Q5HsK/tVFMnCd3HoRzrRkRW230AlapUocfjCC4Kx9Tk4kiUew+JZt6iv;
In-Reply-To: <alpine.LNX.2.01.1204221647400.14663@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 2012-04-22 16:49, Jan Engelhardt pisze:
>=20
> On Sunday 2012-01-29 23:22, Marcin Miros=C5=82aw wrote:
>=20
>> /var/tmp/portage/net-firewall/xtables-addons-1.41/work/xtables-addon=
s-1.41/extensions/ipset-6/pfxlen.c:148:1:
>> warning: type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=
=80=98EXPORT_SYMBOL_GPL=E2=80=99
>=20
> This is probably because the file does not #include <linux/module.h>
> (or <linux/export.h> as it has become); it is, however, no longer
> an issue since ipset-6 is no longer included starting with 1.42.

Hello Jan!
Thanks for information,
Marcin

