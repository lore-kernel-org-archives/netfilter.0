From: Roberto Nibali <ratz@tac.ch>
Subject: Re: ip_conntrack_http?
Date: Wed, 11 Dec 2002 10:56:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF70BC4.1040302@tac.ch>
References: <1039450606.3df4c1ee704fd@mail.whstuart.com> <1039469549.20570.24.camel@tux> <1039534152.3df60848b8692@mail.whstuart.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Shepherd <chriss@whstuart.com>
Cc: Martin Josefsson <gandalf@wlug.westbo.se>, Netfilter mailinglist <netfilter@lists.netfilter.org>

Hello,

While I think you've got a problem with your software architecture I assure you 
that this can be handled with LVS.

>>No, this is how loadbalacing in iptables works, it balances the
>>individual connections.
> 
> That's what I thought.

Load balancing done on a netfilter level is just not extremely intelligent. Use 
LVS. It's the same story as with all the rather clumsy NF modules/enhancements, 
like for example ROUTE. Use the tools that are given to you and don't cludge NF 
with even more deisgns that are not complete. LVS does an excellent job at load 
balancing, iproute2 does an excellent job on routing (and RR balancing too 
actually).

>>>What happens now:
>>>CONN1a -> WS1
>>>CONN1b -> WS2
>>>CONN2a -> WS1
>>>CONN2b -> WS2
>>>
>>>What should happen:
>>>CONN1a -> WS1
>>>CONN1b -> WS1
>>>CONN2a -> WS2
>>>CONN2b -> WS2
>>>
>>>Provided that CONN1[ab] are related connections, but unrelated to
>>
>>CONN2[ab].
>>
>>How do you relate http connections to each other?

In LVS parlance you need persistency. The IP grouping can be achieved with 
fwmark based load balancing, but in your case you won't need it anyway.

> Well, I would think the TCP RELATED flag should be set for the second 
> connection from the browser. Not being a Netfilter programmer myself, I'm not 
> sure if there's any connection identifier that's passed along with the RELATED 
> connection information... If there was, would it not be possible to just 
> forward all related connection IDs to one IP? So at most there should only be 
> two or three connections in a group, and this would sort out situations where 
> people sharing a connection would otherwise all end up on the same webserver, 
> and not be effectively load balanced.

This is a problem, yes, but everyday reports on the LVS mailinglist do not 
mention a big problem with this. Especially since the Internet is very dynamic 
the load imbalance will eventually straighten out. So, don't worry about that.

> On the connection-level, is it possible to somehow see which connection a new 
> connection is related to? If so, I would think it'd be logically easy, but not 
> necessarily programmatically so.

It is relatively easy but not with netfilter. You can track connections with so 
called connection templates and depending on the scheduler the templates vary. 
It is much faster then netfilter.

> I will let you know when I get a chance to test it. I have the sneaky feeling 
> that if this works properly (which it should), a lot of developers might wanna 
> know about it. :)

I doubt this is a good solution. It may work but only solve a limited case of 
load balancing.

>>>I am very interested in knowing, because it could save myself and a few
>>
>>dozen 
>>
>>>webdevs I know a lot of money that we'd be spending on a hardware
>>
>>connection-
>>
>>>level load balancer.

Almost all the people on LVS save money by implementing LVS as a software load 
balancer. It's made for that besides other reasons of course.

>>Other options may be the LVS, Linux Virtual Server project. I believe
>>they have loadbalancers and stuff for http.

Our load balancer doesn't really care about the protocol as long as it is L4.

>>From the documentation I've read, LVS does essentially the same thing as NF 
> does: it forwards on a per connection basis. It too would succumb to this 
> problem. 

Please read the documentation again, you don't seem to have understood it. And 
if you're still not sure about how it works, please join our newcomer-friendly 
LVS mailinglist. Thanks.

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


