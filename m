From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: forwarding traffic to different hosts
Date: Sat, 28 Aug 2004 10:14:25 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC906420F@asimail2.alphanumeric.com>
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

> Good point, how's this?
>
> 207.155.252.12 - out on the Internet somewhere
>   |
>   |
>   |
> 198.81.129.1 - default gateway
>   |
>   |
>   |
> -------------------------------------
>   |                              |
>   |                        198.81.129.101
> 198.81.129.100
>
> So usually a DNS request from the Internet comes in to 198.81.129.100,
> which .100 will answer as normal.  However should .100 receive the DNS
> request from 207.155.252.12 it will redirect that packet to
> 198.81.129.101, back out the interface the packet came in on.  Is that
> even possible?
>
> 198.81.129.100 and .101 have a single interface, IPtables is just =
being
> to protect the hosts themselves.

my first question would be:  is it silly to ask why you don't redirect =
the traffic from 207.155.252.12 to 198.81.129.101 on the 198.81.129.1 =
gateway?

assuming that you cannot...  you're problem trying to do this with NAT =
is one of routing:

original packet:  srcip=3D207.155.252.12, dstip=3D198.81.129.100

[translate packet on 198.81.129.100]

translated packet:  srcip=3D207.155.252.12, dstip=3D198.81.129.101

when 198.81.129.101 receives the translated packet, it responds to =
207.155.252.12 through its default gateway, *not* through =
198.81.129.100...which creates an asymmetric routing situation for the =
upstream firewall--the response packet doesn't match up with the request =
packet (100 changes to 101).

if you *must* do this with NAT on 198.81.129.100, you have to get the =
replies from 198.81.129.101 to go back through 198.81.129.100 in order =
for the packets to get translated back.  two options:

(1) SNAT the packets in addition to DNAT-ing the packets so that they =
appear to come from 100, and 101 will reply back through 100.  this was =
my original answer that wasn't viable in your situation.

(2) Add a static route for 207.155.252.12 on 198.81.129.101 via =
198.81.129.100.  this way the DNAT-ed packets will be forced to go back =
through 198.81.129.100.

neither of the above are what i would call ideal solutions.  the =
"proper" way to do this (IMHO), would be to use the power of the =
application in question (bind) to do what you want (here i go with my OT =
non-netfilter configs).

create a view in bind on 198.81.129.100 for the client 207.155.252.12:

in named.conf:

  acl "specialhost" { 207.155.252.12/32; };
  include "named.conf.specialhost";

in named.conf.specialhost:

view special {
        match-clients { "specialhost"; };
        forward only;
        forwarders { 198.81.129.101; };
};

HTH...

-j
