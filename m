From: "Andreas Granheim" <andreasg@client.no>
Subject: RE: Access to two identical subnets
Date: Wed, 1 Sep 2004 08:53:48 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <9F6B4CE6934BDF4BB50BCF2491C9F69001A4F7@CSMAIL.client.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, sorry for the spaghetti ASCII, here you maybe have a better
overview.

  _____________________________192.168.1.0
    |                       |
    |----------------------FW
    |                       |
 10.50.50.0             10.100.50.0
    |                       |
 ROUTER                 IPTables FW
    |                       |
    |                   10.50.50.0
    |                       |
 10.50.50.0                VPN1
                            | =20
                           VPN2
                            |------------- 10.50.50.0


When I ping from the IPTables FW I get reply. This means that the packet
makes it way from the 10.100.6.3 and back.=20
It's just the IPTables FW and the VPN1 box that stands on the 10.100.6.0
net.

On the other NIC, on the IPTables FW, the IP is 10.100.7.3, who is a
VLAN bone on the FW, the box have a default GW to 10.100.7.1, who is the
main FW, who connects it with the 192.168.1.0 subnet.

ETH1 is on the 10.100.7.3 side
ETH0 is on the 10.100.6.3 side.

Networks involved:

192.168.1.0\25 - Our main network, using 10.50.50.14 to SSH to Subnet A,
and use 10.100.50.5 to SSH to 10.50.50.5 on Subnet B

When trying from the 192.168.1.35, its mangles right, looks fine in the
VPN1 log.=20

Where 10.100.50.5 is mangled to 10.50.50.5, then the VPN1 routes this
through the VPN tunnel, to VPN2, who routes to the machine, then the
10.50.50.5 tries to answer 192.168.1.35, goes back, through the vpn
tunnel. Think it stops at the VPN1 box or the IPTables FW.

How could I log incoming 10.50.50.5 trafic on the IPTables box? Iptables
-A INPUT -j LOG --log-level 3?
Cant se anything in the syslog, or either log.


=20
Do you think the packet from 192.168.1.35 reaches the computer on the
10.50.50.0 net?, and that tries to answer, but when it comes to the
VPN1, it don't know where to go?

Should I see an echo reply already then? Before it has come back to
192.168.1.35 that is the goal for that packet?
Or will the VPN1 log display echo reply when the packet has reached back
to 192.168.1.35.?

Or even, it makes back to the 10.100.6.3 box, but it there doesn't know
where to go... should the one DNAT rule mangle 10.50.50.5 back to
10.100.50.5 by itself? Or do I need another rule that does that?=20

What do you people think about that?

Very thankfully for any reply :)


Message: 7
Date: Tue, 31 Aug 2004 09:26:10 -0400
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Access to two identical subnets
To: <netfilter@lists.netfilter.org>
Message-ID:
=09
<D5C9032B2B09C64EA2409D6214E91AC905130D@asimail2.alphanumeric.com>
Content-Type: text/plain;	charset=3D"iso-8859-1"

> Hello
> The goal is that all computers on the 192.168.1.0 net should have
access
> to two identical 10.50.50.0 subnets.
>
> Like this:

[snip:  incomprehensible ascii art]

> When I ping 10.100.50.5 (linux server on B Subnet) from 192.168.1.35
> (linux comp), I LOG in the VPN 1 box:
>
> 12206.080946 192.168.1.35 -> 10.50.50.5: icmp: echo request
> 12207.081074 192.168.1.35 -> 10.50.50.5: icmp: echo request
>
> But it doesn't get any reply.

it sounds like 10.50.50.5 (B) doesn't route traffic back through the
VPN1 box.
is the VPN1 box the default gateway on the 10.50.50 (B) subnet?

No, I don't think so. Don't remember how the customer sat it up. It, is
an policy on the VPN2 box that route 192.168.1.0 trafic back in the
tunnel, and 10.100.6.0 trafic.


> The output NIC on IPTABLES box is on the 10.100.6.0 net, who also the
> VPN 1 box stands on.
> The 10.100.6.0 and the 192.168.1.0 net is in a group on the VPN 1 box,
> who routes the traffic from these nets to the 10.50.50.0 net via the
VPN
> TUNNEL.
>
> If I ping from the IPTABLES box to 10.50.50.5, I get echo reply, but
not
> from the 192.168.1.35 machine.
>
> 134.344974 10.100.6.3 -> 10.50.50.5: icmp: echo request
> 134.491585 10.50.50.5 -> 10.100.6.3: icmp: echo reply


ok...  what are the networks involved in the VPN?  your source addresses
are
all over the place here...  are the above packets encrypted or clear?

It is encrypted through the VPN tunnel, other than that I think they are
clear.
The 10.100.6.3 is just a router; involved is 192.168.1.0 and 10.50.50.0
network, who should communicate.

> What must I do, will this work at all?

this can be made to work, yes...  it's complicated, and takes some
serious
understanding of how routing is supposed to work (so that you can then
mess with it).

> Do I need other rules?

maybe...

> Will be happy for answers/suggestions :-)

is there any way you can make a better/more readable diagram available?

-j

Yes, at the beginning of this mail.



