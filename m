From: Bhasker Allam <allambhasker@yahoo.com>
Subject: Re: input filter
Date: Wed, 5 Jan 2005 14:30:43 -0800 (PST)
Message-ID: <20050105223043.94871.qmail@web53908.mail.yahoo.com>
References: <41DC212C.4050106@hotpop.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DC212C.4050106@hotpop.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgi Alexandrov <tehlists@hotpop.com>, netfilter@lists.netfilter.org
Cc: allambhasker@yahoo.com

There are a few situations that I can think of:

- A spurious host/hosts sending garbage packets. If I
know either source IP/subnet or mac address I can put
in a filter and drop all the packets from spurious
souces with minimal effort. Why should I spend cycles
doing the route lookup ?
- I could do policy based routing. That is, I want
packets from interface X or subnet S to go out on
interface Y all the rest go via the normal routing
path. From what I read this is not possible now.
- If I use my linux box a router I could have policies
on different interface to do different things. For
example, I might not want packets arriving from
certain sources to reach certain destinations. It does
not matter whether I am forwarding or not. You could
say I could put that in the output filter, but my
argument why should I have go through route lookup if
I don't have to ?

Hope these requirements make sense to you. As I said
earlier, I am a newbie to linux networking. Pardon me
if there are other ways of doing the above using
netfilter.

bhasker.

--- Georgi Alexandrov <tehlists@hotpop.com> wrote:

> Bhasker Allam wrote:
> 
> >Hi,
> >I am a newbie and I was reading the howto for
> packet
> >filter. The howto has the following picture:
> >
> >Incoming                 /     \         Outgoing
> >       -->[Routing ]--->|FORWARD|------->
> >          [Decision]     \_____/        ^
> >               |                        |
> >               v                       ____
> >              ___                     /    \
> >             /   \                   |OUTPUT|
> >            |INPUT|                   \____/
> >             \___/                      ^
> >               |                        |
> >                ----> Local Process ----
> >
> >The input filtering is done only for local bound
> >packets and after the routing decision. Is the
> above
> >true ? 
> >
> yes.
> 
> >Is there a facility to perform input filtering
> >before the routing decision ? Thanks.
> >
> >  
> >
> How come you know if it is INPUT or FORWARD before
> the routing decision ?
> Won't the "routing decision" decide if the packet(s)
> will be destined 
> for INPUT (to the local machine) or FORWARD (for the
> machines behind 
> you/gw/fw).
> 
> The two chains and tables that are hit by incoming
> packets before the 
> routing decision are:
> 1. table mangle, chain PREROUTING (from the
> iptables-tutorial: "This 
> chain is normally used for mangling packets, i.e.,
> changing TOS and so on.")
> then:
> 2: table nat, chain PREROUTING (from the
> iptables-tutorial: "This chain 
> is used for DNAT mainly. Avoid filtering in this
> chain since it will be 
> bypassed in certain cases.")
> 
> If you explain better your situation i'm sure we'll
> find reasonable 
> solution for your filtering needs ;-)
> 
> >Bhasker.
> >
> >  
> >
> Georgi Alexandrov.
> 
> >__________________________________________________
> >Do You Yahoo!?
> >Tired of spam?  Yahoo! Mail has the best spam
> protection around 
> >http://mail.yahoo.com 
> >
> >
> >  
> >
> 
> 



		
__________________________________ 
Do you Yahoo!? 
Take Yahoo! Mail with you! Get it on your mobile phone. 
http://mobile.yahoo.com/maildemo 

