From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 17:44:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207051644.g65Gig802589@vulcan.rissington.net>
References: <Pine.LNX.4.21.0207051614570.12797-100000@grabak.talker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0207051614570.12797-100000@grabak.talker.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 05 July 2002 5:28 pm, Cygnus - Flirttown Coder wrote:

> > The address translation works like this:
> >
> > iptables -A PREROUTING -d a.b.c.d -j DNAT --to w.x.y.z
> >
> > ie any packets addressed to a.b.c.d are changed so that they go to
> > w.x.y.z instead.
>
> so this is the only rule I need to insert to do said in/out NATing?
> no POSTROUTING rules or anything like that.

Correct.   You will need a FORWARDING rule (or an ACCEPT policy on the 
FORWARDING table, which is the default) and you need to have connection 
tracking for NAT loaded, but I take that as standard...

This one rule will translate packets which come into the box addressed to 
a.b.c.d and change them so they go to w.x.y.z instead, and then it will 
translate the corresponding reply packet from w.x.y.z so they appear to come 
from a.b.c.d

It will not alter any other packets, including ones addressed to w.x.y.z in 
the first place, or packets from w.x.y.z which are not replies to packets 
which got translated on the way in.

> > By the way, what bandwidth is your Internet link ?   Don't you think it
> > would be a good idea to put an actual firewall in the link so that you
> > can at least provide some filtering on the system ?
>
> we're using about 11MB/s avg.

You don't need too much hardware to support that level of traffic on a 
Firewall.   I really would recommend you put one into the traffic path now 
while you have the opportunity (and do your address translation on it) 
instead of trying to hang it off a switch port, change over your IPs, and 
then figure out how to put a firewall into the packet flow sometime in the 
future.

> lastly..do you think it would be better if i just put this in between the
> Cisco router and the 1st switch.
> Put 2 eth. cards in it, eth0 coming in from the router, eth1 from the
> 1st switch. Then bind all the gateway ips (there are a bunch) for
> the customers as aliases to the eth1 interface; then I wont have to change
> the client gateways, because all traffic will be going through the
> forwarder no matter what, in pass-through.

Yes, that is exactly how I would recommend doing it.

> If you think this will work better, any good documents to show me the
> iptables rules to make this setup work..besides the ones you gave for the
> specific NATing, of course.

You will need to appropriate FORWARDing rules to allow the traffic through 
the machine, but that's about it.

You should be able to get all you need from 
http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO.html and 
http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html

> (and/or nice test/gui interfaces to streamline management of these rules)

Anyone else want to make some recommendations / plug some products here ?

> I really appreciate this.

Welcome to netfilter.

 

Antony.

