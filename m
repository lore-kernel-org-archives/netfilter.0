From: Jorge Davila <isaac@nicaraguarealestate.com>
Subject: Re: Static/Dynamic NAT Combination
Date: Fri, 28 May 2004 15:52:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40B7B4B0.2000608@nicaraguarealestate.com>
References: <20040528175829.7b5a6da6.leslie.polzer@gmx.net>	<40B79B3E.2050504@nicaraguarealestate.com>	<20040528221802.47e2957c.leslie.polzer@gmx.net>	<200405282127.42236.Antony@Soft-Solutions.co.uk> <20040528230807.21ed5eae.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040528230807.21ed5eae.leslie.polzer@gmx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>
Cc: Patrick Leslie Polzer <leslie.polzer@gmx.net>

Patrick Leslie Polzer wrote:

>On Fri, 28 May 2004 21:27:42 +0100
>Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
>
>  
>
>>1. Give us a specific example of what you want to happen, showing us the 
>>source & destination addresses & port numbers for machines A & B, so we can 
>>see exactly what you want to do
>>    
>>
>Okay, maybe this time I'm better at it.
>
>There is a thing called 'binat' on OpenBSD.
>'binat' does NAT on _all_ incoming and outgoing connections on a specific
>interface, so I guess it is basically SNAT and DNAT combined in Netfilter
>jargon.
>So let's say there a router "R" with an interface called ppp0
>(1.1.1.1) and another one called eth0 (192.168.1.1/24), and a last
>one called eth1 (192.168.2.1/24).
>Moreover assume a box called 'A' on the eth0 network, and another one
>called 'B' on the eth1 network.
>So think of 'A' as my main working machine - it runs a webserver
>and maybe a lot more listening daemons. So I'd like to redirect
>any connections to R/ppp0:* to 'A' - with ports preserved of course.
>Also, any connection from eth0 which is routed via R/ppp0 must get
>translated - again, preferably (but this time not a must) without
>any port changing. That's the thing for box 'A' - not much of a problem
>for Netfilter, I suppose. Now 'B' comes into play. 'B' wants the standard
>NAT via R/ppp0 to the internet - no special stuff with ports here, just
>standard SNAT.
>Now, will there be any conflicts with this setup? Is it possible at all?
>To make things even more complicated, some ports should be excluded from
>the DNAT R/ppp0:* -> A, like 6667, because I want to run an IRC server
>on R (which is up 24/7).
>
>I hope this time my explanations are easier to understand as I don't
>like wasting other people's time for nothing.
>
>Thanks!
>
>Leslie
>  
>
pp0
+--------+
| router  |
+--------+
eth0 -> for net 192.168.1.0/24 -> here is the box A  [ in box A are many 
daemons runing ]
eth1 -> for net 192.168.2.0/24 -> here is the  box  B  [ nated ]

.- All packets *to* (pp0 and service port [in A]) must be *redirected* 
to box A. The packets wich destination port is a service port on A must 
go to A
.- If incoming packets in pp0 has a destination port over 1024 must pass 
the pp0 device with alteration....

I think thtat iptables can do the task.....


