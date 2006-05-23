From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Wierd black hole
Date: Tue, 23 May 2006 18:15:09 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C6C@knowledge.wizdom.nu>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Klaubert Herr da Silveira <klauberts@yahoo.com>, netfilter@lists.netfilter.org

Lol

If you don't give me directions to your home, how the heck would I get
there to beat you up for asking such a simple question. :-p

But seriously, you probably don't have a default route configured (or
it's pointing out on another interface).
If you don't have a proper route, packets will follow default route, or
when there is none they are discarded and an ICMP NO_ROUTE_TO_HOST is
sent to the originator.

-Sietse

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Klaubert
Herr da Silveira
Sent: Tuesday, May 23, 2006 6:07 PM
To: netfilter@lists.netfilter.org
Subject: Wierd black hole

Hi,=20

I had a wierd situation here, and I'd like to understand why this
happen.

I setup a Iptables firewall doing a static NAT for a partner network,
and a
Firewall-1 protecting internal network. Like this.

                       eth1    eth2
Partner <-> Router <---> Iptables <---> Fw1 <-> Internal Network
                           Nat          Nat

A build the firewall and nat rule with Firewall Builder, however I
forgot to
insert the apropriated route in Iptables machine to Nat in Fw1. What is
already
solved. The route to partner network is always there.

The question is. Why, whithout the route, the ip packet don't cross the
firewall (iptables)? They reach eth2 (my side) interface, but dont get
routed
out to eth1 (partner side), as tcpdump could show me.No Drop were
trigged.
Something like a black hole.

As soon I put the apropriate route, the packet cross both interfaces,
reach
destination and come back to iptables box.

Any idea?

Klaubert

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20


