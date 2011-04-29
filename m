From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 13:12:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104291310150.2679@obet.zrqbmnf.qr>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr> <993639.25943.qm@web111704.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291305050.2679@obet.zrqbmnf.qr>
 <716679.51968.qm@web111703.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <716679.51968.qm@web111703.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-04-29 13:09, Mahmood Naderan wrote:

>>But I talked about the kernel.
>
>Sorry but I am confused. What is wrong with kernel?=20

Quoting myself from earlier:

>>Make sure you kernel is configured with these enabled, and don't forg=
et=20
>>to actually provide the modules, if not already built-in, because it=20
>>does have the looks of a crippled installation, judging from the miss=
ing=20
>>modules.dep.

>Since the client can boot and I can login to that,=C2=A0I don't think =
any=20
>thing wrong=C2=A0with kernel.
>
>Can you exaplain more?

Just booting the kernel is only half of the work. In most cases,
you still need a function /lib/modules/* directory - and that is
what seems to be afoul in your system.
