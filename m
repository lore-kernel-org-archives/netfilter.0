From: "Jon Wilson" <jon.wilson@3waynetworks.com>
Subject: RE: Raw sockets send/receive through NAT
Date: Thu, 28 Sep 2006 17:11:36 +0100
Message-ID: <93EDDD37BB21F242B60066B66AC0D657B278C4@euw0300240.xe2hosting.net>
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
To: netfilter@lists.netfilter.org

> > I have a requirement to NAT packets sent using raw sockets (
> > socket(AF_INET, SOCK_RAW, IPPROTO_TCP/ICMP) ).  The machine I'm
using
> > has a single interface with a 192.168.x.x address and I want to send
a
> > packet from this machine with a 10.x.x.x source address (hence raw
> > sockets) and have the 10.x.x.x address NAT'd to the 192.168.x.x
address.
> > I'm using POSTROUTING MASQUERADE'ing on eth0.  I've got a couple of
> > questions:
> why do you do that ? Just for fun or something else ?

:-) Not for fun!  The packets are arriving from mobile devices through
proprietary h/w and s/w and I need to send them on to the local LAN /
internet (and forward responses back to the mobile devices...).

> >
> > 1.  How do I receive the returned (raw) packets *after* they have
> > traversed the NAT i.e. in the 10.x.x.x IP space?  If I use libpcap
for
> > example, I get the 192.168.x.x IP space packet but what I need is
the
> > packet post-NAT with the 10.x.x.x IP address.
> You can just send the package , and wait for the response package ,
> the kernel netfilter will do
> other things for you .
> I think postrouting and prerouting will affect your package in a
> transparent way .

I actually got this working today.  Using raw packets I can receive all
packets and filter on destination IP address, pulling out only those
that are for the mobile devices.  It turns out that using raw sockets
gives me the packets post-NAT so the IP addresses are back in the
private range (10.x.x.x in my example).  Maybe this is common knowledge
but I've struggled to find it documented.  If I use libpcap/tcpdump I
get packets pre-NAT and this is what I was expecting raw packets would
give me.  Fortunately I was wrong :-) so I now have a solution.

Hope this is of help to someone out there!

Jon


