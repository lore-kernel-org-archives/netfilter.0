From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: simple port translation on the localhost / local loopback
Date: Fri, 28 Mar 2008 11:35:23 +0100
Message-ID: <47ECC9EB.1000308@plouf.fr.eu.org>
References: <20080327211643.B37CA78C86@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080327211643.B37CA78C86@gam.mel.teaser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Noino <mg8c1zu02@sneakemail.com>
Cc: netfilter@vger.kernel.org

Hello,

Noino a =E9crit :
> Searching found that, maybe, a kernel option : CONFIG_IP_NF_NAT_LOCAL=
=20
> should be necessary for PAT to work on the local host; can you confir=
m=20
> that it would indeed work if I were to recompile my kernel with that=20
> option set ?

I confirm. On 2.6 kernels < 2.6.11 and 2.4 kernels < 2.4.29 this option=
=20
must be enabled in order to do local NAT on loopback.

> Further search seemes to imply that this option was=20
> removed from later kernels altogether, which gets even more confusing=
=2E..

In later kernels the local NAT ability is still present but is not=20
optional any more, so you do not have to bother about it.
