From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Troubles with iptables, ip and VPN
Date: Mon, 16 Jun 2008 12:56:02 -0500
Message-ID: <4856A932.80608@riverviewtech.net>
References: <48563EBE.9050108@greffe-tc-paris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48563EBE.9050108@greffe-tc-paris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/16/08 05:21, Mathieu Espagnacq wrote:
> It's my first time on this list, i hope it's the right place for 
> posting this kind of question.

Here or the Linux Advanced Traffic Routing mailing list are probably the 
best places (that I know of) to ask for help.  Although I think LARTC 
might be a bit better as this seems to be more of a routing issue than a 
firewalling issue.

> My goal is to make a management network for different site. Those site 
> are strictly independent and can localy use same IP. I decided to use a 
> server to host openvpn and route packet. I decided than every site will 
> use a subnet on this virtual network using DNAT to translate with adress 
> on local network.

Ok...  I can tell you from experience that doing such with routing is 
going to be fraught with problems.  Sure you will get it to work with a 
few clients but things will get harder as you add more clients and have 
more conflicting / overlapping networks.

A solution that I've seen is a form of double NAT that isolates each 
network from each other.  Consider this simple (single client) scenario 
below.

           +--------+
(LAN A)---+ Router +---(LAN B)
           +--------+

So that LANs A and B don't have to have routes for each other, clients 
on each LAN connect to the router its self and then have the router DNAT 
the traffic to the other LAN while SNATing the traffic as it leaves the 
router.  This way, each LAN will see connections originating from the 
router with in their own subnet thus allowing replies to go directly 
back to the router with out any routing needing to be set up any where 
(Other than the NATing router its self).

             +-----+           +-----+               +-----+
(Mgt LAN)---+ MIR +===(VPN)===+ CIR +---(Clt LAN)---+ DGW |
  A.B.C.x    +-----+           +-----+    D.E.F.x    +-----+

MIR = Management Interface Router
CIR = Client Interface Router

Here we have a non overlapping subnet between the Management LAN and the 
Client LAN.  To make things more interesting, the Client LAN uses DGW as 
it's default route to the net, not through the Client router.

In this case, a client on the management network will connect to the 
management side of the client interface router, which will DNAT traffic 
to the appropriate real destination on the client LAN while also SNATing 
the traffic making it appear to the real destination like the client 
interface router is connecting to it.  Thus when the real destination 
needs to reply, the replies are with in the local subnet and no routing 
needs to be configured.  Thus the real destination replies back to the 
client interface router, which unNATs the traffic sending it back to the 
management network.
             +-----+           +-----+               +-----+
(Mgt LAN)---+ MIR +===(VPN)===+ CIR +---(Clt LAN)---+ DGW |
  A.B.C.x    +-----+           +-----+    A.B.C.x    +-----+

MIR = Management Interface Router
CIR = Client Interface Router

Here we have an overlapping subnet between the Management LAN and the 
Client LAN so with out help the above solution will not work.  What I 
would be tempted to do is like before to have clients on the management 
network connect to the management side of the client interface router 
and have the client interface router do what it did before.  However we 
will need to have the management interface router SNAT the traffic as it 
leaves the management network on its way to the client network.  This 
way the client interface router will not see the same A.B.C.x subnet on 
both interfaces.

<snip>

> And from kernel log something :
> martian source 10.0.253.2 from 172.21.1.69, on dev tap0
> ll header: 00:ff:ff:88:88:a1:00:ff:f5:cc:7c:74:08:00

What is your reverse path filtering set to?

> I don't really understand why packet coming back from 172.21.1.69 to 
> 10.0.253.2 (10.0.254.1 before nat) don't go on tap1.

Can we see a network diagram (or a better description so that we can 
create one) to better be able to help you?

> Thanks for readings, regards,

*nod*



Grant. . . .
