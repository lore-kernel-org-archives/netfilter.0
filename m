From: Tvrtko Ursulin <tvrtko@ursulin.net>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Wed, 9 Jun 2010 14:41:04 +0100
Message-ID: <AANLkTiksaw95iTQ0XVtb4vHhWzWWYA30Fuf_E1l7nqkm@mail.gmail.com>
References: <201006082203.22238.tvrtko@ursulin.net>
	<alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr>
	<201006090900.54496.tvrtko@ursulin.net>
	<alpine.LSU.2.01.1006091159110.12139@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006091159110.12139@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 9 June 2010 11:02, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Wednesday 2010-06-09 10:00, Tvrtko Ursulin wrote:
>>
>>Firewall rules do not mention ICMP and I can ping outside world so I guess
>>that means it is not blocked?
>
> ICMP is not just ping, there is more like PMTUD and others.
> If PMTUD works on your side, you don't need TCPMSS.

Is there a way to check that across the link? If my router has no ICMP
rules in iptables than should I suspect the ISP?

>>I tried doing "ifconfig eth0 mtu 1452" on the client and that did not help.
>
> Just for the record, do _not_ use ifconfig, but ip in the future.

Ok, will look at it.

>>Site I was testing with is http://www.tesco.com/superstore/ . This page does
>>not load unless MTU 1400 is set on the client.
>
>>> If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
>>> but 2.6.25 looks good), and if either client or server make use
>>> of it, things can hang once SACKs are exchanged.
>>
>>My clients are 2.6.31 - 2.6.34, but the router/firewall is running 2.6.21.5.
>
> Well try deactivating sack/dsack/fack then (that's in sysctl).

On the router? Will try in the evening.

What is puzzling me is that Windows clients work fine, even though
they also have MTU set to 1500. All I am reading about his issues
cannot explain this to me.

Tvrtko
