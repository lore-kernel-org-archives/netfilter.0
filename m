From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from
 Linux
Date: Wed, 9 Jun 2010 17:02:19 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006091658050.30265@obet.zrqbmnf.qr>
References: <201006082203.22238.tvrtko@ursulin.net> <alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr> <201006090900.54496.tvrtko@ursulin.net> <alpine.LSU.2.01.1006091159110.12139@obet.zrqbmnf.qr>
 <AANLkTiksaw95iTQ0XVtb4vHhWzWWYA30Fuf_E1l7nqkm@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTiksaw95iTQ0XVtb4vHhWzWWYA30Fuf_E1l7nqkm@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tvrtko Ursulin <tvrtko@ursulin.net>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-06-09 15:41, Tvrtko Ursulin wrote:
>>
>> ICMP is not just ping, there is more like PMTUD and others.
>> If PMTUD works on your side, you don't need TCPMSS.
>
>Is there a way to check that across the link? If my router has no ICMP
>rules in iptables than should I suspect the ISP?

	ping -M do -s 9000 target

From <router> icmp_seq=1 Frag needed and DF set (mtu = 1412)

Then you retry with

	ping -M do -s $[1412-28] target

and do that as long as Frag needed is outputted.
That's basically manual PMTUD and allows you to see where
MTU reduction along the route occurs.

>>>> If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
>>>> but 2.6.25 looks good), and if either client or server make use
>>>> of it, things can hang once SACKs are exchanged.
>>>
>>>My clients are 2.6.31 - 2.6.34, but the router/firewall is running 2.6.21.5.
>>
>> Well try deactivating sack/dsack/fack then (that's in sysctl).
>
>On the router? Will try in the evening.

No, on at least one of the end host(s).
(Since you have control over your client, that shouldn't be a problem.)

>What is puzzling me is that Windows clients work fine, even though
>they also have MTU set to 1500. All I am reading about his issues
>cannot explain this to me.

That's why I suspected SACK issues. (Because SACK is too smart a
technology to be usable in Windows ;-)
