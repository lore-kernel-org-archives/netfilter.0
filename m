From: Robert White <rwhite@pobox.com>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sun, 2 Jul 2017 21:10:30 +0000
Message-ID: <5e96bc48-550c-4ec1-e0c4-5a929a456012@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
 <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
 <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: oyvind@dynator.no, netfilter@vger.kernel.org

On 07/02/2017 03:58 PM, =D8yvind Kaurstad wrote:
> My device is not meant to be a system (or full blown) router per se. It
> is a specialized custom device that for some cases needs to be able to
> act as a router. It does not act as a DNS server, and in most cases
> there will be other routers in the system (at least on the eth0 network,
> and my device is usually set up as a DHCP client on eth0).

That's as "router-ish" as routers get. Don't think of it as "not a
full-blown router". It may be expected to only have a light packet load
but that doesn't make it anything less than a router.

First I am going to juggle your addresses a little to get your device
(and all of eth1), that is the inner protected network ("PRO") out of
the same 192.168.0.0/16 chunk as your "General use network" (e.g. "GUN",
e.g. whatever is connected to eth0). This is just to prevent mental
typos as I continue.

So address ranges:

GUN: 192.168.0.0/16
PRO: 172.16.0.0/12
INTERNET: *whole world otherwise

So within your router everything going towards 192.168.0.0/16 will go
out eth0, and everything going to 172.16.0.0/12 is going to go out eth1.

And your problem is that INTERNET is both on ppp0 and some dominant
router somewhere in 192.168.0.0/16 (out eth0 somewhere), yes?

First notice that this problem, where the internet is in two places,
exists regardless of the NAT. So the problem isn't NAT related, its pure
routing table stuff.

Basically, if the flow came _in_ ppp0 you want it to go _out_ ppp0.

This is where people were talking about marking the packets/flow but
then what?

(DISCLAIMER: I don't have a test rig for this so I'm just typing stuff.
There may be typos or errors, but this _should_ be just about right. Now
to carry on...)

So first, we want to use connection marking. That is, we want any mark
we make on any packet something that will live as long as we consider
that flow valid.

iptables --table mangle --insert 1 PREROUTING --jump CONNMARK --restore-mark

iptables --table mangle --append POSTROUTING --jump CONNMARK --save-mark


So now any marks we ever put on any packet will be automatically applied
to the response packets.

Now we want to mark any connection that starts life in from ppp0. The
only hard-and-fast requirement is that this marking rule below must
happen _after_ the "restore-mark" rule above. So it could go in FORWARD
or POSTROUTING or whatever.

iptables --table mangle --append PREROUTING --in-interface ppp0 --jump
MARK --set-mark 1
--ALTERNATELY--
iptables --table mangle --append PREROUTING --in-interface ppp0 --match
conntrack --ctstate NEW --jump MARK --set-mark 1

The latter is more precise by only explicitly marking new connections,
but it is also probably not necessary to be that precise because that
in-interface condition is very strong.

You are also going to want to have a DNAT rule for arriving packets and
an SNAT/MASQUERADE rule for ppp0, but again, don't bother with any SNAT
from for 192.168.0.0/16 (etho0) or 172.16.0.0/12 (eth1).

ASIDE: if your router thing is supposed to front-end/hide it's interior
geometry from all comers, you might want a DNAT rule on eth0 and ppp0.
Then the DHCP address received by the router on 192.168.X.X will appear
to be your protected device.

# Port 80 transparently forwareded to protected device
iptables --table nat --append PREROUTING ! --in-interface eth1
--protocol tcp --dport 80 --jump DNAT 172.16.x.x
# anything originating from the device is SNAT on all _other_ ports.
iptables --table nat --append POSTROUTING --in-interface eth1 --jump
MASQUERADE

(other ports, protocols, and policies work the same way as 80 etc)

At this point we are done with iptables. We've directed the traffic and
we've marked the flow. Now it's pure routing rules. We need to move the
default route to the ppp0 adapter for the marked packets.

So pick a number, I've picked "500", we are going to use this number to
create a routing rule table.

Lets give that number a name so that we don't have to deal with the
number. This is a persistent setting so don't put it in your startup
scripts. Just do it once as root.
# echo "500 ppp0_routes" >> /etc/iproute2/rt_tables

Now very early after each/any startup you need to add a rule that says
"for all packets marked with a "1" I want to use some specific routing
information, adn that's going to be in that table we just mentioned.

ip rule add fwmark 1 table ppp0_routes

(For clarity, the condition is "fwmark 1" so for all unmarked packets,
from unmarked connections, or packets marked with any other number, the
"normal default" route will apply because this ppp0_routes table will be
skipped completely.)

Whenever ppp0 starts up, you'll need to add the default route going out
ppp0 for all the packets that have been marked. So in your "ifup" or
"post_up" script/function for ppp0 you want to add

ip route add default via $NEXTHOP dev ppp0 table ppp0_routes

"via $NEXTHOP" may not be necessary depending, but if it is NEXTHOP is
whatever default router the PPP connection startup says you should use.
Check your pppd documentation for how to collect this information, and
be sure to use the "no default route" option for pppd itself as you
don't want pppd to overwrite the default route you got from dhcp.

This route will _disappear_ whenever ppp0 goes down, which makes cleanup
automatic, and is also why you need to put this command in the
ifup/pos_up script to put it back.

And you are done... (give or take whatever errors I made since, like I
said, I have no means to test this here.)

SECOND DISCLAIMER: I haven't messed around with PPP in probably eight
years or so, so I don't know if you'll need to put more rules in the
ppp0_routes list. In particular if your eth1 connection is not direct,
you might want to put in a route for 172.16.X.X or whatever. I don't
think you will need to, but I recall PPP to be sort of a big jerk.

At this point:

All sessions started from INTERNET coming in through the normal
infrastructre (eth0) is going to go back out the GUN/infrastructure
default route.

All sessions started from the GUN infrastructure itself (192.168.X.X)
will go out to the GUN infrastructure "naturally".

All sessions started by the protected device or anything on the PRO
network will go out via the GUN.

All sessions started by a packet coming in through the ppp0 link will
use the ppp default router as their default.

SO TO RECAP:

(1) it's a route selection problem not a NAT issue.

(2) rule based routing does the heavy lifting.

(3) packet marking lets you easily activate the alternate rule, and so
the alternate default router, without touching the outcome for any other
packets.

(4) you may have to fiddle with some stuff because my suggestion is
untested stuff from memory. 8-)

> Not sure if this clarified anything, but it still seems to me I need to
> leverage the connection tracking with packet marking to be able to
> ensure the reply packets that should go back out a non-default route
> actually does that.

It has actually clarified a lot. Sorry I misunderstood. I thought your
eth0 was the transport under your PPP session (As in ppp-over-ethernet.
My bad. 8-)

As shown, packet marking and connection tracking is the easiest way to
go. You might be able to craft some ip rules to avoid the marking but
it's not worth it when the marking solution is so simple. Performance
impact should be trivial and limited to the ppp0 link anyway.

Again, apologies. Being told I missed "something" wasn't as helpful as
being told what thing I missed. /D'oh
