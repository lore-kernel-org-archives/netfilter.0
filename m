From: Vivek Kashyap <kashyapv@us.ibm.com>
Subject: Re: Round Robin Load Balancing
Date: Tue, 18 Nov 2003 00:47:28 -0800 (Pacific Standard Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.WNT.4.44.0311180025530.1480-100000@w-vkashyap95.des.sequent.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,

I came across the discussion below -- here is what I tried for
load-balancing across multiple interfaces :

1. created a target called RANGEMARK.

-j RANGEMARK --set-rangemark <base>[-limit[.increment][:r|h][,S|O|A]

The idea is to be able to mark the packets in the range base to limit with
increments of <increment>. r implies the values, within the range, are
picked randomly. h is porthash. S implise set the nfmark value, O is OR
and A is AND.

2. Now set the equalize path

ip route add Z src X equalize nexthop via Y1 dev y1 \
			      nexthop via Y2 dev y2 \
			      nexthop via Y3 dev y3


3. Set the iptables rules

iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
iptables -t mangle -A OUTPUT -p tcp --tcp-flags SYN,RST,FIN SYN -j \
                                    RANGEMARK --set-rangemark 1-4:r,S
iptables -t mangle -A OUTPUT -p tcp --tcp-flags SYN,RST,FIN SYN \
                                     -j CONNMARK --save-mark

4. Must have enabled equal path routes and fwmark based routing in the
kernel


Now, every new connection (SYN flag) will be assigned a random mark by the
RANGEMARK target. The route cache will add the route with the fwmark
included. The next connection to the same destination will likely not get
the same fwmark and so will not match the cached routes and the kernel
will pick a route one of the other equal path routes. The 3rd rule stores
the mark value for a connection. The first rule marks all packets
belonging to the same TCP session with the same mark so that they follow
the same path out.


Vivek

PS. I posted the RANGEMARK patch to netfilter-devel on Nov. 6th.

====================================

>With that regard it doesn't matter if the routing desision has already
been made or not...
I would've thought it does matter as your packet has gone through all the
proper chain paths and now it's about to leave into the ethernet and your
now forcing it back through routing and out again through another
interface.. unless the patch jumps a bit or something...

OK the URL makes the point, as you saw my example was all there was so I
kinda hard coded that what it was supposed to be used in... (PREROUTING)..
I guess it couldn't hurt trying it though.. ;P

Has anybody tried marking the packets and then using iproute2 instead of
the ROUTE patch to go via a different ethernet??

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: Monday, August 11, 2003 5:26 PM
To: George Vieira
Cc: Javier Govea; netfilter@lists.netfilter.org
Subject: Re: Round Robin Load Balancing


On Mon, Aug 11, 2003 at 08:30:20AM +1000, George Vieira wrote:

> Hate to burst your bubble

Hey, don't worry...

> but isn't the ROUTE module being used a _little_ too late.

No, not really. At least not according to:

http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE

> I mean, it's suppose to reroute to a new device but your using it in
POSTROUTING which means it's to late to reroute it (basically leaving the
interface and out to the internet)...
>

That is the traditional routing, but this module _forces_ the packet to go
wherever you want... With that regard it doesn't matter if the routing
desision has already been made or not...

Ramin

> >From memory, the ROUTE module is supposed to be used in PREROUTING on
the internal interface so that it doesn't hit the routing table yet and
the rule modifies which interface to go out on..
>


__

Vivek Kashyap
Linux Technology Center, IBM


