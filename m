From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Routing from ppp to ipsec tunnel
Date: Mon, 18 Aug 2008 16:16:45 -0500
Message-ID: <48A9E6BD.7060600@riverviewtech.net>
References: <1289.10.211.10.2.1219080259.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1289.10.211.10.2.1219080259.squirrel@mail.thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/18/08 12:24, devel@thom.fr.eu.org wrote:
> I have two sites connected using an IPSEC Tunnel (Linux 2.6/KAME 
> Tools). I can also have "roadwarriors" clients (Windows based) 
> connect to either site using an L2TP/IPSEC tunnel.

Ok...

> I would like to know if it's possible to route packets from the 
> roadwarrior client (sent out through my ppp interface) through the 
> inter site ipsec tunnel and back.

Yes.

> So far, the only way I could have this work was by SNATing the 
> traffic from my ppp network destined to the other site network to the 
> local lan interface address, but I'd rather not use SNAT to achieve 
> this.

SNAT / MASQUERADE will work, but as you are seeing is undesirable.

> Anybody can help?

As I see it there are a couple of different things working against you.
 1)  You will have to add routes to each VPN gateway for the road
warriors on the other end.
 2)  You will need to (re)configure your IPSec VPN to allow the
additional road warrior IP space.

I don't know what you have for IP address space on either end of the
VPN, so I can't say for sure what you need to do.  In essence you will
need to provision a new subnet for the road warriors at each end.  This
can be done by either creating a new dis-similar subnet for the road
warriors or if the IP addressing scheme will allow by enlarging the
subnet (reducing the netmask by one bit).  If you can do the later
things with in your VPN will be easier because you can just alter the
netmask of what IPs are allowed to go through (match) the VPN.  If one
office is 192.168.0/24 and the other is 192.168.1/24 then you can't
expand the netmask with out re-addressing one end or the other and you
will have to more drastically adjust your VPNs.

I've not had to mess with an IPSec VPN that had multiple dis-similar IP
subnets pass through them, so I can't say how to do it.  In short, you
will have four subnets in the company, Site 1 LAN, Site 1 Road Warrior,
Site 2 LAN, and Site 2 Road Warrior.  With this in mind you will need to
have your VPN allow traffic from either LAN or Road Warriors at Site 1
to either LAN or Road Warriors at Site 2.  So you end up with these
possible combinations

1L <-> 2L
1L <-> 2R
1R <-> 2L
1R <-> 2R

(You may be able to get away with out allowing a road warrior at one
site to talk to another road warrior at the other site, thus negating
the need for 1R <-> 2R.)

But this does mean that you will need to allow at least the first three
subnet to subnet communications.  If you can not define these in one
single IPSec VPN, you /may/ have to establish a separate IPSec VPN for
each subnet to subnet pairing.  Thus what was one simple site to site
VPN now becomes three site to site VPNs.  :(

I know that this seems like a lot of work just to allow road warriors to
be able to access other remote sites, but I agree with you hole
heartedly about not wanting to SNAT / MASQUERADE.  (Though you could get
away with just nating the road warrior traffic and not the rest of the
site to site traffic.)



Grant. . . .
