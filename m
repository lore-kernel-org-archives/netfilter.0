From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: mixed address family sets and rules in nft
Date: Sat, 04 Jun 2022 16:34:07 +0200
Message-ID: <87r144mra8.fsf@alfa.kjonca>
References: <YptiDLW0raHPYCgg@torres.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1654353249; bh=cxnSApiYB4diBZgchlaUd1KFTKtIdVReEspPuT1HIW0=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=DcX3GDDDUzoJmYhpYzfiQi1iMunq5w0hzQIv0/4PRuM1khHAqWBnyLXA8WxJSB69P
         2Uip15SeeQgF/ZAjYv/zGMQSOdn1VMM+pbTm/KbO7odidU1d8Dv4zkRS7txjOcbsJP
         SWpStvYdPALsUNrRKkQhW6j/+2jAfflR9aNxuN10=
In-Reply-To: <YptiDLW0raHPYCgg@torres.zugschlus.de> (Marc Haber's message of
        "Sat, 4 Jun 2022 15:45:48 +0200")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Marc Haber <mh+netfilter@zugschlus.de> writes:

> Hi,
>
> I am somewhat a newbie to nft, but I have been doing Linux packet
> filtering for way more than 20 years, starting with ipfwadm back in 1997
> or 1998.
>
> In nft, I would like to be able to write something along the lines of
>
> |@@def $host = (85.214.160.151 2a01:238:42bc:a101::2:100)
> |
> |chain INPUT saddr $host proto tcp dport 22 ACCEPT

I think that strictly speaking this (=mixing ipv6 and ipv4 in one
set[1]) is not possible.

but there is no problem separately (as you probably know this)

--8<---------------cut here---------------start------------->8---
define host_4 = { 85.214.160.151 , .. and other hosts.. }
define host_6 = { 2a01:238:42bc:a101::2:100 , and other hosts }

tcp dport ssh ip saddr $host_4 accept;
tcp dport ssh ip saddr $host_6 accept;
--8<---------------cut here---------------end--------------->8---

When you talking about "hundreds" of addresses - you probably will need
to use some kind of script to split ipv6/ipv4 addresses.
Or use named set and manipulate them separately on the fly.


KJ

[1] - i know that ipv4 space is mapped into some subset of ipv6



-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
