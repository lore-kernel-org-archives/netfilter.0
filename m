From: "semi linux" <linuxsemi@gmail.com>
Subject: Re: Two NICs, same network...
Date: Thu, 24 May 2007 13:12:37 -0700
Message-ID: <e53321d30705241312l6aee149bp3557f72476940bc@mail.gmail.com>
References: <e53321d30705081317w3d7e6f5bsb38161f155c883da@mail.gmail.com>
	<Pine.LNX.4.63.0705081251200.20281@qynat.qvtvafvgr.pbz>
	<e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>
	<4641CC42.2000005@alpha2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=GriaXwdWYVJjELj5YV5XDdimMBy3sfLBxkpFckDq064QPJSaXzFhKBmK+elZBkYq1r+7CHBoxXS7cHjd+8M2W8jg4oGPv+ZivG2OWCFz7idbX+ZZrhbOLXoE8LnHwaU633y1d1TN7H/9XMt4SmTLx2BU5ydtSJQr0vdIRW1ZHh8=
In-Reply-To: <4641CC42.2000005@alpha2.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: David Lang <david.lang@digitalinsight.com>

Sorry for the latent reply on this one guys - I got pulled off this
project and after this thread progressed I had a lot of test cases and
scenarios to work my way through.  While I haven't finished testing
and I'm not sure I adequately explained the situation I think I have
found a workable resolution.

Adding ETH0 to the bridge just got really compilcated and messy.
Packets started to be routed to all kinds of places in different
network scenarios and it wasn't the right answer to the problem
although it did show quite a bit of promise initially.  With this
approach, we also lost the ability to fine-tune the bridge routing and
left it up to the STP and other bridge algorithms.

Channel bonding is nice, but also not what we were after.  It worked
but in certain deployment scenarios we would need eth0 to be on
different network(s) from the rest of the machine and the setup of
this would be on a case-by-case basis.  this is a little too hands-on
for the guys who would be deploying the solution ;-)

Finally, we looked into modifying our default routing table.  I
_think_ this is going to be our end solution.  I have devised a set of
tests and hopefully it will expose any and all bugs that might come
from this solution.  Preliminary tests suggest that this will work
well and can be easily adapted to suit our installations.

thanks for all the help and suggestions guys!  I knew this was
possible but I didn't figure on there being 2-3 workable solutions.
Means to an end, I guess.  Thanks!

- Gareth

On 5/9/07, Mark L. Wise <mark@alpha2.com> wrote:
> Is this not a routing issue?
>
> route add -host 10.1.1.3  gw <eth2 ethernet address> eth2
>
> This would route all traffic to 10.1.1.3 to eth2
>
> Mark
>
>
>
> semi linux wrote:
> > On 5/8/07, David Lang <david.lang@digitalinsight.com> wrote:
> >> On Tue, 8 May 2007, semi linux wrote:
> >>
> >> > I've got an odd problem where I've got two NICs on the same network
> >> > and I want all traffic to one IP to go out one interface and all other
> >> > traffic to use the second interface.  I'm going to try an simplify my
> >> > actual setup, because a lot of it makes no difference to this post...
> >> >
> >> > I know this has to be a iptables sort of setup since the routing table
> >> > can only make a difference on different networks and not based on
> >> > looking for a specific IP address.
> >> >
> >> > The question is:
> >> >
> >> > eth0 IP: 10.1.1.1
> >> > eth1 IP: 10.1.1.2
> >> >
> >> > target: 10.1.1.3
> >> >
> >> > (these IPs are just examples, there are no hard-fast rules surrounding
> >> > the other possibilities)
> >> >
> >> > How do I make sure this goes out eth1 instead of eth0?  Do I use the
> >> > mangle rule with the physdev module?
> >> >
> >> > I feel like I'm overlooking something or forgetting my basic network
> >> > ideas here...
> >>
> >> you haven't quite given enough info here
> >>
> >> if you have target2 10.1.1.4 and you want all traffic to target to go
> >> out eth0
> >> and all traffic to target2 to go out eth1 then you would want to
> >> start out with
> >> defining host routes (the routing table _can_ look at specific hosts,
> >> not just
> >> networks)
> >>
> >> in addition, I believe that you will need to play around with arp
> >> filtering to
> >> make sure that each NIC only responds to arp requests for it's IP
> >> addresses.
> >>
> >> if you really only have one remote IP address and two local addresses
> >> and you
> >> want all communications between the target and  10.1.1.1 to use eth0
> >> while
> >> all communications between the target and 10.1.1.2 to use eth1 things
> >> get more
> >> complicated
> >>
> >> you would need to look into packet/connection tagging and iptables
> >> routeing
> >> decisions.
> >>
> >> rather then try and go into that right now why don't you try to be a
> >> little
> >> clearer about exactly what you are trying to do.
> >>
> >> David Lang
> >>
> >
> > Ok... you asked for the whole thing, here it is (forget my previous
> > example):
> >
> > eth0 - 10.1.1.1
> > eth1 - N/A
> > eth2 - N/A
> > br0 (eth1, eth2) - 10.1.1.2
> > target - 10.1.1.3
> >
> > The bridge (br0) is setup using brctl and seems to work w/o problem...
> > The eth1 and eth2 IP addresses really don't matter since they are both
> > referenced via the bridge and are set to something invalid.  10.1.1.3
> > is connected via cross-over cable to eth2 port.  br0 and eth0 are
> > connected to my network on the same subnet.
> >
> > What I'd like:
> > - all packets (from the network or local) where destination=10.1.1.3
> > to be routed to eth2.
> > - otherwise, all traffic from the network to use eth0 for I/O.
> >
> > Basically, I want to specify that ONLY traffic for 10.1.1.3 is to use
> > eth2.
> >
>
> --
> Mark L. Wise
>
> Alpha II Service, Inc.
> 1312 Epworth Ave
> Reynoldsburg, Ohio 43068-2116
> USA
>
> Office: (614) 868-5033
> Fax: (614) 868-1060
> Email: mark@alpha2.com
> WEB: www.alpha2.com
>
>

