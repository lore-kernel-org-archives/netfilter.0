From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipv6 forwarding without netfilter
Date: Sat, 31 Jul 2010 23:27:29 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007312323310.27642@obet.zrqbmnf.qr>
References: <AANLkTik0MPyj4Vthm1fFXA56yEMW-a5FJ_vP6+-U+WhQ@mail.gmail.com> <4C5461BF.1000604@plouf.fr.eu.org> <76D2688A-63A7-4D46-BE14-197B9AE6FD97@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76D2688A-63A7-4D46-BE14-197B9AE6FD97@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ABPNI <jonnyt@abpni.co.uk>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, Mark Ryden <markryde@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Saturday 2010-07-31 23:23, ABPNI wrote:
>>
>> Yes.
>> If you don't need filtering, you don't need ip6tables.
>
> Am I correct in saying that iptables/ip6tables doesn't actually alter/affect
> "path" of traffic, but only either allows or blocks?--

You are correct in your assessment. The currently-included Xtables
modules do not alter the path of existing traffic. Modules might
create new packets and do some routing with them (e.g. REJECT, TEE),
but the original packet is accepted/drop/continued. Modules might
also change packet parameters (like nfmark) that will influence the
path decision later on.
