From: "Javier Govea" <jgovea@magma.ca>
Subject: Re: Round Robin Load Balancing
Date: Sun, 27 Jul 2003 13:40:31 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307271740.h6RHeV1F001051@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>, Javier Govea <jgovea@magma.ca>
Cc: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

Hi guys,

I tried the following line (i'm using "-j ROUTE" instead of "-m route", as Daniel wrote
before, because the route patch is actually a target and because "-m route" was giving me
a an error. But if i'm doing it in the wrong way, please correct me):

iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -m state --state new -j ROUTE
--oif ppp0

and i got:

iptables: Invalid argument

I think the ROUTE target doesn't work with the nat table. Has anybody use NAT and ROUTE 
together?? I tried also the following rule but i got the same error message:

iptables -t nat -A POSTROUTING -j ROUTE --oif ppp0

However if i use the mangle table then i do not get an error (the rule below works) but my
host cannot access inernet and no wonder, i need the NAT/MASQUERADE  stuff:

iptables -t mangle -A POSTROUTING -j ROUTE --oif ppp0

I also tried:

iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -m state --state new -o ppp0 -j
MASQUERADE

with this rule my hosts can access internet if i have only one browser open (and it works
faster than before, when i wasn't using "-m state --state new") but if i open two browsers
then none of them can access internet.

Am i using the wrong rules??? Does anybody has any other ideas??? Can my problem of load
balancing internet traffic actually be solved with some combinations of rules?? or Am I
going in the wrong direction???

Any ideas or suggestions are all very much appreaciated...
Thanx to all of you guys...
X
PS. In my rules above i'm only showing one rule in each case but i'm actually using four
rules (one for each ppp link) in all cases.

> Yeah, it is wrong...
> 
> #1. Only perform this on state 'new' packets. After that, let snat take 
> care of making sure they go through the right interface.
> 
> #2. You need the 'route' patch as well..
> The rules that you define will only work if the packets are going to the 
> correct interface to begin with. To allow every 4th CONNECTION to travel 
> through each interface as you described below, you might want to try:
> 
> iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -m state --state new -m route
--oif ppp0
> iptables -t nat -A POSTROUTING -m nth --every 4 --packet 1 -m state --state new -m route
--oif ppp1
> iptables -t nat -A POSTROUTING -m nth --every 4 --packet 2 -m state --state new -m route
--oif ppp2
> iptables -t nat -A POSTROUTING -m nth --every 4 --packet 3 -m state --state new -m route
--oif ppp2
> 
> 
> As described earier, this does not guarantee 100% load balancing, but it 
> will help.
> 
> >I'm not sure if NTH does not work well with the masquerade target (has anybody use NTH and
> >Masquerade succesfully????) or if i'm applying the wrong rule (below are my rules) or if
> >just the NTH patch doesn't really work....
> >
> >any ideas or suggestions are all very welcome....
> >
> >Here are my rules:
> >
> >iptables -t nat -A POSTROUTING -m nth --every 4 --packet 0 -o ppp0 -j MASQUERADE
> >iptables -t nat -A POSTROUTING -m nth --every 4 --packet 1 -o ppp1 -j MASQUERADE
> >iptables -t nat -A POSTROUTING -m nth --every 4 --packet 2 -o ppp2 -j MASQUERADE
> >iptables -t nat -A POSTROUTING -m nth --every 4 --packet 3 -o ppp2 -j MASQUERADE
> >  
> >
> 
> 
> 

