From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Access to two identical subnets
Date: Tue, 31 Aug 2004 09:26:10 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905130D@asimail2.alphanumeric.com>
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

> Hello
> The goal is that all computers on the 192.168.1.0 net should have =
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

it sounds like 10.50.50.5 (B) doesn't route traffic back through the =
VPN1 box.
is the VPN1 box the default gateway on the 10.50.50 (B) subnet?

> The output NIC on IPTABLES box is on the 10.100.6.0 net, who also the
> VPN 1 box stands on.
> The 10.100.6.0 and the 192.168.1.0 net is in a group on the VPN 1 box,
> who routes the traffic from these nets to the 10.50.50.0 net via the =
VPN
> TUNNEL.
>
> If I ping from the IPTABLES box to 10.50.50.5, I get echo reply, but =
not
> from the 192.168.1.35 machine.
>
> 134.344974 10.100.6.3 -> 10.50.50.5: icmp: echo request
> 134.491585 10.50.50.5 -> 10.100.6.3: icmp: echo reply

ok...  what are the networks involved in the VPN?  your source addresses =
are
all over the place here...  are the above packets encrypted or clear?

> What must I do, will this work at all?

this can be made to work, yes...  it's complicated, and takes some =
serious
understanding of how routing is supposed to work (so that you can then
mess with it).

> Do I need other rules?

maybe...

> Will be happy for answers/suggestions :-)

is there any way you can make a better/more readable diagram available?

-j

