From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
Subject: [Noob Q.:] UDP, complementary DNAT+SNAT unicast->multicast ==> uh oh, conntrack hurdle...
Date: Tue, 29 Sep 2015 18:00:14 +0200
Message-ID: <560AB58E.11784.42956DE@Frantisek.Rysanek.post.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
	t=1443543162; bh=37Ncqa1H+ZYRqusK5lCEC3kBUFlOvd8SGPtDBcpILJI=;
	h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
	 X-mailer:Content-type:Content-transfer-encoding:
	 Content-description;
	b=C5TjVGjBzDQbqywN2dc6ZaTZsHmVL+FQaT+yqTaMjES3eSmoc1Tsh9xcKGAj0WJ0g
	 B+FFv0BuozaY8lBk4XqCdCs24WTV8Zw/7WgHoHDyiBXenU9RiJZ5x/SWHSBXqUb1lb
	 BdcB83jNeZRqfmVspk0GtNPajvNbVFg+M2jI/vZ8=
Content-description: Mail message body
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear polite people of the netfilter community,

I have a newbie question about the NAT and conntrack on UDP traffic.

Let me start with the practical scenario of what I'm trying to 
achieve:
This is a story from the world of SCADA, serial fieldbusses etc. 
Industrial process control. There's a SCADA machine, acting as a 
single master for some miscellaneous serial multi-exit fieldbus 
(request+response style). 
Traditionally, the master would talk straight to the serial bus, 
running along all the slaves. 
In our case, in the legacy system, the SCADA machine already uses 
unicast UDP to send its requests to a "terminal server" (232<-->UDP 
relay box), from where the serial bus runs a long way to all the 
telemetry slaves, allegedly across further WAN bridges and whatnot.
The task at hand is to move more of this serial bus onto IP 
infrastructure. To take the UDP traffic further along Ethernet, and 
only convert to serial at some more focused "satellite" locations.

The key element in this plan is to use multicasting.
The Ethernet switching inftrastructure is there, with VLAN's,
IGMP snooping, even a querier (if the switch vendor is right in his 
bold claims).
And the key constraint is, that the venerable SCADA machine
must not notice the change - that it must not require a 
reconfiguration. Possibly it isn't all that easy to reconfigure the 
software to send multicast traffic while awaiting unicast responses.

An obvious answer would be: do your homework, schedule some
downtime, hire a relevant SCADA consultant and just reconfigure the 
darn old box.
Yes of course... but corporate politics aside, it is an interesting 
academic exercise if nothing else :-) And it almost works...

=> at the level of UDP and IP addressing, what it apparently boils 
down to is a requirement to:

1) DNAT the legacy unicast UDP packets (requests) to a new multicast 
destination (IP address / mcast group), and 

2) to SNAT the response traffic coming back, to look like it's coming 
from the original "unicast request destination" = IP addr and UDP 
port. The response traffic comes from a handful of unicast origins 
(our choice of numbering = some nice subnet per multicast group = per 
emulated fieldbus segment).

Original IP networking topology:
[SCADA] ---UDP unicast--- [legacy terminal server]

New topology, mimicking the old one for the SCADA box:
[SCADA] ---UDP uni--- [NAT router] ---UDP multi--- [dest.boxes]

On the requests, I need to DNAT both the destination IP address and 
UDP port, and on the responses, I need to SNAT the source IP addr and 
UDP port back to the legacy addr:port of the one legacy unicast 
serial gateway.

I've actually tried configuring the two simple complementary NAT 
rules. Modulo some subplots around multicast forwarding, the need for 
a multicast routing daemon, a querier etc. - I'll add more details 
further below.
Here I am, I have my two NAT rules in place, I've handled several 
prerequisites (gotchas for the unwary), I have tcpdump running on the 
two router interfaces, and it still doesn't work, for some reason...

=> now for the hurdle:

The request packets do get DNATted and forwarded just fine.
The response traffic gets dropped by the SNAT rule - probably because 
the particular "touple" is already allocated by conntrack to the DNAT 
session. The ephemeral conntrack table entry, conjured by the DNAT 
rule upon the arrival of a first UDP packet in the "request" 
direction, remains forever "unreplied" and thus relatively 
short-lived, yet capable enough of preventing response traffic coming 
back, from using the original "touple", which is now "owned" by the 
DNAT conntrack ephemeral...

In /proc/net/ip_conntrack, I can see two ephemeral conntrack entries:
one for the DNAT rule (requests), one for the SNAT rule (responses).
=> the response direction actually earns a conntrack entry, but then
it gets dropped "per packet" anyway :-)

What I tried:

If I modify the SNAT rule, to make it "not perfectly complementary",
such as - I change the IP address *or* the UDP port in the SNAT 
target, just by one unit, suddenly it works.

The way I've configured the NAT router, the SCADA is sending its UDP 
requests to the NAT router's own IP address facing the SCADA on the 
IP subnet they share = the requests are originally destined for the 
INPUT chain on the router (before getting DNATted and forwarded) - 
but I don't think it would make any difference, if I made the router 
"step aside a little" and not mimick the original terminal server
(probably by some weird trick in the way of proxy-arp, as they're on 
the same subnet in the first place anyway).
Based on the fact that DNAT happens in PREROUTING, I rest assured 
that the NAT and conntrack would work exactly the same...

Clearly this is a result of the blessed marriage of NAT with 
conntrack, within the netfilter framework. As far as I can tell, it's 
impossible to create a "stateless" or one-way-only NAT rule.
There are no relevant targets in the mangle or raw tables. 
If I exempt the request traffic from connection tracking via the raw 
table's NOTRACK target, it doesn't get NATted either.
Netfilter NAT can only be connection-tracked, there's no other way.
Your return traffic shall be handled automagically by the conntrack 
backend, period.


At this point I'd like to add a brief list of the "prerequisites" 
that I went through, and of my environment, maybe for Google and 
other apprentices coming after me:

I did set /proc/sys/net/ipv4/ip_forward to "1" manually.

As other sources point out, it's impossible to configure 
/proc/sys/net/ipv4/conf/all/mc_forwarding
manually to "1" - the entry is inherently "read only", 
and you need to install and run some multicast routing daemon to 
enable multicast forwarding by some magical spell... Some use 
smcroute, I've tried XORP. Packaged with the source code of DVByell, 
you can find a basic config for XORP to work as a querier only, on a 
single interface. In my practical case, I ended up using the default 
XORP config generated by Debian Jessie, as it mentioned both of my 
two Ethernet interfaces.
(I also found a Perl script called igmp-querier.pl, that did send 
some v2 membership requests, but failed to provoke my IGMP client to 
respond with a JOIN, which is something XORP has achieved right away 
with its default v2 config.)

I'd like to admit to using the stock Debian Jessie kernel 
(3.16.0-something).
The one thing why I don't think that this a distro-specific bug, or a 
bug that got fixed in a more recent upstream kernel release, is that 
the whole thing does *not* feel like a *bug*. The observed behavior 
of connection tracking on UDP feels like the natural way to do it, 
feels very correct to me, for the general case. 

The point is, that what *I'm* trying to achieve is something 
unobvious. To get my asymmetrical unicast-to-multicast-and-back NAT 
setup to work, the NAT+conntrack engine needs additional knowledge of 
my network numbering, and of my precise intentions - a special config 
for a special case. The generic off-the-shelf tools available from 
netfilter are not equipped to handle my special requreiments,
and the generic UDP connection tracking code sure has no way
of inferring my twisted intentions in all the required detail 
(machines clearly haven't mastered telepathy just yet).

What to do about it:

If I absolutely insist on dragging this funny "special hybrid of all 
legacy-preservation kludges" any further, I'd probably have to pull 
off one of the following:

1) write my own "NAT helper" (like the ones already there for FTP, 
H.323 and other protocols using multiple streams per user session)

2) enhance NAT and connection tracking on UDP in some generic way, to 
allow for a configurable setup of such unholy asymmetrical multicast 
traffic that I'm trying to achieve. 

3) find a suitable Achilles heel in the stack of UDP NAT, generic 
NAT, UDP conntrack and generic conntrack, where I could perform a 
minimal focused hack, to prevent UDP SNAT from dropping my packets on 
a touple already occupied by a previous ephemeral conntrack entry 
belonging to DNAT. Again it feels like I would be mutilating 
something that's perfectly correct in the first place. You *do* want 
to prevent traffic from colliding on a touple already occupied. 
In my special case, in the confined environment of an industrial 
plant LAN, I can be pretty sure on that single router, that I'm not 
going to NAT any other UDP traffic. All the rest of the traffic will 
only get forwarded (TCP sessions for remote management etc.)

To be honest, I probably don't have the time (or balls, or both) for 
1) or 2). I've barely had the time to fumble through the source code 
to pick up some vocabulary that I'm merrily chucking around here :-)

=> if anyone would be so nice to suggest a particular place, where to 
place a hack along the lines of 3), I'd love to get to know.

Either way might help other people do the same thing for different 
reasons. The "traffic pattern" doesn't seem all that alien - except 
for my special luxury, that the serial fieldbus protocol transported 
over UDP uses its own addressing of the slave nodes, hence doesn't 
care if responses from multiple slaves come from a common IP address.


Then again, it's also possible that I'm completely wrong about my 
diagnosis of the problem = the gremlins are hiding elsewhere.

Or, possibly there's a way of configuring netfilter by the means 
already available off the shelf, to achieve my lay man's quick job.

If you've read this far, thanks for your attention...
And have a nice day on whatever it is that you're busy with :-)

Frank Rysanek

