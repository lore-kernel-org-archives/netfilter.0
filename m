From: Nox <pheusion@snet.net>
Subject: Re: n00b question.....   How to get details on active connections
Date: Tue, 23 Sep 2003 11:59:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064332777.22271.56.camel@shaolin.gridlocksecurity.com>
References: <20030923144031.93650.qmail@web60106.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030923144031.93650.qmail@web60106.mail.yahoo.com>
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
To: Stack Buffer <black_merkury@yahoo.com>
Cc: netfilter@lists.netfilter.org

Good mourning Stack.
1 - 4 of those modules, I dont have installed into my filter,
but I am not doing te same as you, so Im not sure if youll need them or
not.

The best way would be to compile them as modules,
the reason being that they are loaded during boot up, rather than
directly into your kernel, making things boot faster.

I dont have anything from under QOS either, so you may not need that

Item 1 & 2, 

1) IP:Multicasting.
> 
> 2) IP:Policy Routing.

those you may need, but the others I think you can get rid of.
the file that contains the modules is:
/etc/modules & /etc/modules.conf

I think adding all those are a little bit overkill,
I dont think youll ever use most of the 

Qos and/or
Fair queueing

stuff, so try it without that

Ip Multicast is for,
One host sending a packet to all nodes on a multicast network.
(Ive never used it)
The reason for this is, save bandwidth.
Instead of sending one single packet to 10 machines, which results in 10
packets on the network, you send one packet to 10 hosts,
at once.

Policy Routing
Is exactly what it sounds like,
instead of having routes in your routing table, you can create rules in
your Iptables, for routing connections
Much more control of where those routes go, logging on the routing
of those connections, etc. I think you should leave this, as it comes in
handy



Use netfilter as mark:(from manpage)
The MARK target is used to set Netfilter mark values that are associated
with specific packets. This target is only valid in the mangle table,
and will not work outside there. The MARK values may be used in
conjunction with the advanced routing capabilities in Linux to send
different packets through different routes and to tell them to use
different queue disciplines (qdisc), etc. For more information on
advanced routing, check out the Linux Advanced Routing and Traffic
Control HOW-TO. Note that the mark value is not set within the actual
package, but is an value that is associated within the kernel with the
packet. In other words, you can not set a MARK for a packet and then
expect the MARK still to be there on another host. If this is what you
want, you will be better off with the TOS target which will mangle the
TOS value in the IP header. 

TCP_syncookies.

Send out syncookies when the syn backlog queue of a socket
overflows. This is to prevent against the common 'syn flood attack'
could come in handy   
     

Good job with your first Kernel compile.

Let me know how the rest goes.

Nox
GenMicro Systems

On Tue, 2003-09-23 at 10:40, Stack Buffer wrote:
> Hi Nox
> 
> Well I did manage to get the kernel compiled (Redhat
> 9.0)
> kernel 2.4.20-8,
> and it booted the system fine, although I think it is
> pretty large.
> I was not sure of the following though and I hope u
> can help clearify thing for me:
> 
> 1) IP:Multicasting.
> 
> 2) IP:Policy Routing.
> 
> 3) IP:Use netfilter mark value as router.
> 
> 4) IP:TCP syncookie support.
> 
> Plus also I compiled in everything under the netfilter
> configuration and also everything under Qos and/or
> Fair queueing. Is that over kill to compile all those
> otions in?. What are the trade off of compiling
> (netfilter stuff) things as modules,rather than
> directly into the kernel, will I lose any
> functionality.
> I will be very thankful for any help.
> Thanks
> Cheers
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com
> 


