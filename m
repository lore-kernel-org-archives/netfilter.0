From: nowhere <nowhere@hakkenden.ath.cx>
Subject: Re: Problems with xtables-addons 1.3.7 on Gentoo
Date: Fri, 05 Aug 2011 17:41:05 +0400
Message-ID: <1312551665.24824.9.camel@rybalov.eng.ttk.net>
References: <CAA2qdGWwQC7G-YR=onrUBVAOEG1yrM8Ambr3m5JxvEOPjj1c+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGWwQC7G-YR=onrUBVAOEG1yrM8Ambr3m5JxvEOPjj1c+A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D1=82=D0=BD, 05/08/2011 =D0=B2 20:19 +0700, Pandu Poluan =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I'm having troubles with xtables-addons 1.3.7 on Gentoo.
>=20
> I successfully installed xtables-addons (no errors), but all attempts
> to create an IP set (e.g., `ipset --create test hash:ip`) resulted in
> the following error message:
>=20
> FATAL: Error inserting ip_set
> (/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.k=
o):
> Invalid module format
>=20
> `insmod` begat an additional information:
>=20
> insmod: error inserting
> '/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.k=
o':
> -1 Invalid module format
>=20
> `dmesg | tail -1` gave a worrying error:
>=20
> [ 4085.271442] ip_set: exports duplicate symbol ip_set_nfnl_put (owne=
d
> by kernel)
>=20
> What should I do?

Do you by any chance have ipset enabled in kernel config or ipset
separatedly installed with "modules" use-flag?

>=20
> Rgds,


