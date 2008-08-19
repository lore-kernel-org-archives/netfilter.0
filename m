From: devel@thom.fr.eu.org
Subject: [Fwd: Re: Routing from ppp to ipsec tunnel]
Date: Tue, 19 Aug 2008 09:19:58 +0200 (CEST)
Message-ID: <49353.80.118.132.195.1219130398.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thank you for this quick answer.

I tried first to set it up as you mentionned :
Say site 1 lan is 10.211/16 site 2 lan is 10.212/16
road warrior 1 range is 10.210/16 (let's first don't consider the secon=
d
road warrior access)

So at first (before trying to turn on road warriors) I configured the
following SAs :

10.211.0.0/16 to 10.212.0.0/16 and vice versa on each end of the VPN (a=
nd
this worked fine)
and add the routes 10.212.0.0/16 through 10.211.254.254 (being the vpn
gateway lan address)
and 10.211.0.0/16 through 10.212.254.254 on site 2 gateway

These 2 VPN gateway also act as nating firewall for internet access, an=
d
so all the lan client are configured with these address as default
gateway.

So far, this work great.

Then to allow road warrior attached to site 1 traffic go through the
tunnel, I thought I just had to modify the SAs and routes as follows :

10.210.0.0/15 to 10.212.0.0/16 and vice versa on each end, then on site=
 2
gateway, replace the route to site one by 10.210.0.0/15 through
10.212.254.254.

At this point, the intersite VPN works ok, but when I try to ping site =
2
gateway from the local (site 1) ppp end, I can't get the traffic go
through the tunnel. I can see the packet (I use LOG target in netfilter=
)
get out ppp0 in the OUTPUT table, then go through the POSTROUTING table=
 in
NAT chain, and that's all. No IPSEC traffic is generated for the packet=
=2E

What did I do wrong ?

=46ran=E7ois

---------------------------- Message original -------------------------=
---
Objet:   Re: Routing from ppp to ipsec tunnel
De:      "Grant Taylor" <gtaylor@riverviewtech.net>
Date:    Lun 18 ao=FBt 2008 23:16
=C0:       "Mail List - Netfilter" <netfilter@vger.kernel.org>
-----------------------------------------------------------------------=
---

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
Site 2 LAN, and Site 2 Road Warrior.  With this in mind you will need t=
o
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

I know that this seems like a lot of work just to allow road warriors t=
o
be able to access other remote sites, but I agree with you hole
heartedly about not wanting to SNAT / MASQUERADE.  (Though you could ge=
t
away with just nating the road warrior traffic and not the rest of the
site to site traffic.)



Grant. . . .
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20


