From: Tvrtko Ursulin <tvrtko@ursulin.net>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Wed, 9 Jun 2010 18:51:27 +0100
Message-ID: <201006091851.27924.tvrtko@ursulin.net>
References: <201006082203.22238.tvrtko@ursulin.net> <AANLkTiksaw95iTQ0XVtb4vHhWzWWYA30Fuf_E1l7nqkm@mail.gmail.com> <alpine.LSU.2.01.1006091658050.30265@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006091658050.30265@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wednesday 09 Jun 2010 16:02:19 Jan Engelhardt wrote:
> On Wednesday 2010-06-09 15:41, Tvrtko Ursulin wrote:
> >> ICMP is not just ping, there is more like PMTUD and others.
> >> If PMTUD works on your side, you don't need TCPMSS.
> >
> >Is there a way to check that across the link? If my router has no ICMP
> >rules in iptables than should I suspect the ISP?
> 
> 	ping -M do -s 9000 target
> 
> From <router> icmp_seq=1 Frag needed and DF set (mtu = 1412)
> 
> Then you retry with
> 
> 	ping -M do -s $[1412-28] target
> 
> and do that as long as Frag needed is outputted.
> That's basically manual PMTUD and allows you to see where
> MTU reduction along the route occurs.

Starting from mtu=1500 and testing with "ping -M do -s $[$mtu-28] 
secure.tesco.com
", first value which does not need fragmentation is 1492 which is what the MTU 
is set to the PPPoA interface on the router. Would that look like there is no 
problem?

Sidenote - if I change the  PPPoA MTU on the router to 1462, which is 
allegedly optimal for ATM, then the above ping test starts to pass only with 
mtu=1462.

Does this make any sense? secure.tesco.com is the host browsers are waiting a 
response from forever.. Am I misunderstanding the results of the ping test?

> >>>> If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
> >>>> but 2.6.25 looks good), and if either client or server make use
> >>>> of it, things can hang once SACKs are exchanged.
> >>>
> >>>My clients are 2.6.31 - 2.6.34, but the router/firewall is running
> >>> 2.6.21.5.
> >>
> >> Well try deactivating sack/dsack/fack then (that's in sysctl).
> >
> >On the router? Will try in the evening.
> 
> No, on at least one of the end host(s).
> (Since you have control over your client, that shouldn't be a problem.)
> 
> >What is puzzling me is that Windows clients work fine, even though
> >they also have MTU set to 1500. All I am reading about his issues
> >cannot explain this to me.
> 
> That's why I suspected SACK issues. (Because SACK is too smart a
> technology to be usable in Windows ;-)

Unfortunately disabling all three on the client did not help. Plot thickens. 
:)

Thanks for your help so far - I already learned a lot, including that I know 
little. :)

Tvrtko
 
