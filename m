From: "Jesse Gordon" <jesseg@nikola.com>
Subject: IPsec UDP 500 being changed? by iptables?
Date: Mon, 24 Jul 2006 14:30:42 -0700
Message-ID: <00a201c6af68$6a6ac6c0$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter <netfilter@lists.netfilter.org>

Hello,

I've a VPN tunnel running between two firebox endponts through my linux 
iptables natting firewall,
and one end can always bring up the tunnel, but the other can't. I'm trying 
to understand why, and I noticed something strange on the output of tcpdump, 
which makes it look to my untrained eye that iptables is changing the flags 
on the vpn packet.

So my question is "Why does the packet appear differently in tcpdump when it 
leaves my iptables NAT box then when it enters said NAT box?" Should not 
only the source and destination IPs change?

Specifically, it comes in with the flags ".. I ident" and leaves with the 
flags ".. ? ident."

Note: my tcpdump is connected to the switch port analyzer port on our switch 
and captures any packet that enters or leaves either internal or external 
network cards on my NAT firewall. That's why the packets each show up twice.

In more detail:

13:42:03.966796 IP 10.0.0.110.500 > 64.14.174.134.500: isakmp: phase 1 I 
ident
13:42:03.966945 IP 64.14.180.239.500 > 64.14.174.134.500: isakmp: phase 1 ? 
ident
13:42:03.968916 IP 64.14.174.134.500 > 64.14.180.239.500: isakmp: phase 1 R 
inf
13:42:03.968936 IP 64.14.174.134.500 > 10.0.0.110.500: isakmp: phase 1 R inf

10.0.0.110=one vpn endpoint. 64.14.174.134=other vpn endpoint.

The above shows one endpoint sending out a UDP port 500 packet attempting to 
establish a tunnel with *.134. Then my iptables NAT firewall box relays the 
packet on out from it's own IP of *.239, sending the packet to the intended 
*.134. But notice that the flags say ? ident instead of 1 ident the second 
time the packet is seen, on the other (outgoing) side of the NAT box.

Then of course the other endpoint sends back a response, which gets port 
forwarded on in to the first endpoint.

But the tunnel will not come alive, so I'm wondering if my iptables is 
changing something in that packet, which is causing the attempt to fail.

If attempted from the other end, the tunnel comes right up.

I searched google but could not find out what that "?" vs. "I" meant.

Where could I read about the meaning of the output of tcpdump that tells 
about these protocols? (my man tcpdump doesn't.)

Thanks very much,

-Jesse Gordon


Nikola Engineering Inc.
224 W. Washington St.
Suite 104
Sequim, WA 98382-3371
Tel  (360)582-1051
Fax (360)582-1104




