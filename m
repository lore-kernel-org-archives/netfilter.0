From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: semi OT: default route
Date: Wed, 20 Oct 2004 12:56:28 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E389@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Lopsch <lopsch@lopsch.com>, Netfilter-Mailinglist <netfilter@lists.netfilter.org>

> Quote from LARTC-Howto Chapter 4:
*snip*

Just on this topic, I haven't looked at this for a long time, but with
said configuration, how is the traffic balanced exactly?

Route A1 and Route A2 are main routes for the network interface.

I have a single connection, say A:1111 -> B:80. If I send it through the
firewall, will it always use route A1/A2, or will it use the line's
weight as a differentiator? I must assume that 1. The source IP of the
connection will always return on the same path A1/A2 but not balanced
over both. 2. Not all ISP's will route packets sourced from another ISP.
I'm pretty sure the bandwidth splitter in iproute2 is stateless, so it
won't split up SYN's between each line's source IP.=20

So you could have a perfect 50:50 split of outgoing packets and
potentially end up with a horribly unbalanced 100:0 inbound rate if the
source IP ip of each connection isn't equalized based on the weight as
well. My previously stated nth example forces connection based
equalization which I think is a better balancing scheme than a single
direction flow control of a stateless round robbin balance. Man, that's
a long description.

Assuming you have many similar sessions, my stated solution works great.
The worst case is when you have connections that vary from bandwidth
usage. If you have 1 http connection sucking up 800MB, and 30 10kb http
sessions, the balance will place 800.018MB on one line while the other
line only utilizes 150kbits. What we need is a netfilter match rule that
works better than the round robbin 'nth' rule to select the best
outgoing route... (*dreaming*)

