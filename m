From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from
 Linux
Date: Wed, 9 Jun 2010 12:02:57 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006091159110.12139@obet.zrqbmnf.qr>
References: <201006082203.22238.tvrtko@ursulin.net> <alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr> <201006090900.54496.tvrtko@ursulin.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201006090900.54496.tvrtko@ursulin.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tvrtko Ursulin <tvrtko@ursulin.net>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-06-09 10:00, Tvrtko Ursulin wrote:
>
>Firewall rules do not mention ICMP and I can ping outside world so I guess 
>that means it is not blocked?

ICMP is not just ping, there is more like PMTUD and others.
If PMTUD works on your side, you don't need TCPMSS.

>I tried doing "ifconfig eth0 mtu 1452" on the client and that did not help.

Just for the record, do _not_ use ifconfig, but ip in the future.

>Site I was testing with is http://www.tesco.com/superstore/ . This page does 
>not load unless MTU 1400 is set on the client.

>> If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
>> but 2.6.25 looks good), and if either client or server make use
>> of it, things can hang once SACKs are exchanged.
> 
>My clients are 2.6.31 - 2.6.34, but the router/firewall is running 2.6.21.5. 

Well try deactivating sack/dsack/fack then (that's in sysctl).
