From: Unknown <unknown@unknown.invalid>
Subject: Re: iptables newbie questions
Date: Fri, 16 Apr 2004 10:52:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <42948.0749801316$1082128216@news.gmane.org>
References: <407F9DA0.80008@bsdmon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <407F9DA0.80008@bsdmon.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: matthieu <matthieu@bsdmon.com>, netfilter@lists.netfilter.org

On April 16, 2004 04:47 am, matthieu wrote:
> hi
> i have three questions about iptables:
>
> 1/
>
> i read the packet-filtering howto
> (http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO.html) the
> first example uses the ip_conntrack module, which allows the state match
> rule, as in the following rules :
>
> iptables -A block -m state --state NEW -j REJECT
>
> on the other hand, my red hat 9 was automatically configured by lokkit with
> something that looks similar but without using ip_conntrack:
>
> iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
>
> what are the exact differences between these two ways of doing the same
> thing ? (Is it related to the way fragments are handled ?)

	Not knowing redhat's lokkit script (which is sorta proprietary) -- 
	The first rule you list simply cans all "new" connections that 
	get passed to the "block" chain.  To truly understand the block chain, one must 
	contemplate what rules put packets into it, the second, lokkit, rule blocks all 
	packets wth only syn set, agin, you need to contemplate what rules are putting
	packets into the chain to understand what it will accomplish. -- There is a 
	slight difference in what the two rules will drop, but as I am coming off a rather rough
	night at work the finer point escapes me.

>
> 2/
>
> about fragments (see
> http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html)
>
> in the paragraph "specifying fragments", it says:
> "If you are doing connection tracking or NAT, then all fragments will get
> merged back together before they reach the packet filtering code, so you
> need never worry about fragments."
>
> but 5 lines below, it also says that we can only filter the first fragment,
> because further fragments don't have their tcp header.
>
> so, are fragments merged or not ? Does it mean that by default, fragments
> are not merged but that as soon as we use nat or ip_conntrack they are
> merged ? This is what i understand but i just want a confirmation..
>
	I f you are NOT doing connection tracking or NAT you will see the *first* fragment
	in a TCP stream -- you can set rules on that ... 

> 3/
>
> i'm new to linux so this one may seem trivial, but let's ask it:
> how are netfilter routing and other kernel routing related ?
> i mean:
> there is a /sbin/route command that lists a routing table, and we can also
> modify this table. but there is also some routing in iptables, as far as i
> understand. also, browsing through some howtos i saw mentions of a iproute2
> command All of this is very confusing to me, so what is the architecture of
> all this ? i already read "The journey of a packet through the linux 2.4
> network stack" by harald welte but it did not help clarifying the overall
> scheme

	netfilter routing: we will alter the packet to follow a route.
	     (effectively the nat and mangle *prerouting* tables are just that -- they sit out front 
	      of the kernel routing tables, and the nat/mangle *postrouting* see the packets after they are
	     routed)

	kernel routing: we will decide, based on the routing tables where a packet will go

	ioproute2: we can mark, alter and manage the packet through both:
	           iptables can "mark" a packet and use that mark to pass it through the firewall rules, 
	           and ---- IF i've been reading correctly this mark can be seen by iproute2 to handle 
	 	  the passage through the kernel routing tables. 
	         Once installed it effectively replaces the default kernel routing.
	
	iproute2 is not by default installed on most distributions, and adds much facility for 
	managing routing ...  

	PLEASE NOTE: ---> My explaination might be a little thin, and slightly foggy considering my sleep deprivation but its to the best of my ability.


	Alistair Tonner
	


>
> thanks in advance

