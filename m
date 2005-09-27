From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 17:04:10 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2E72@farmer.vikus.com>
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
To: Alaios <alaios@yahoo.com>, netfilter@lists.netfilter.org

Comments inline, consider not top-posting, it makes reading so much
easier...

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alaios
> Sent: Tuesday, September 27, 2005 4:24 PM
> To: John A. Sullivan III
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Plz i need help.... or i ll be fired :(
>=20
> Its not on a different network.. eth1 is directly connected=20
> with this network

But it is on a different network.

>=20
> "John A. Sullivan III" <jsullivan@opensourcedevel.com> wrote:
> What is the default gateway for the laptop? How does it get to
> 143.233.222.253 since that is on a different network? - John
>=20
> On Tue, 2005-09-27 at 09:52 -0700, Alaios wrote:

Notice that our target host is 143.233.222.253.

[eth0 snipped]
=20
> > eth1 Link encap:Ethernet HWaddr
> > 00:02:2D:3B:1D:96
> > inet addr:143.233.222.77
> > Bcast:255.255.255.255 Mask:255.255.255.192

[non-essential stuff snipped]

Your internet address is 143.233.222.77 and your network mask is
255.255.255.192. That 192 means you only have 64 IPs in your network. If
you don't believe me then google CIDR masks for yourself like I did a
couple years back. Now supposing that your network address is
143.233.222.76 (and it is probably 143.233.222.64), you run out of IPs
at 143.233.222.139, which is your network's default broadcast address.
This is quite far away from 143.233.222.253 so your packet never gets to
the intended host.

[lo snipped]

> > Kernel IP routing table
> > Destination Gateway Genmask Flags
> > Metric Ref Use Iface
> > 143.233.222.64 0.0.0.0 255.255.255.192 U 0 0 0 eth1=20
> 10.0.0.0 0.0.0.0=20
> > 255.0.0.0 U 0 0 0 eth0 127.0.0.0 0.0.0.0 255.0.0.0 U 0 0 0 lo

[A ton of stuff snipped]

Notice your first routing entry there, which has the same netmask ending
in 192. When a packet comes to your router, the router looks through all
the entries for a matching subnet. It sees 143.233.222.253 is the
destination IP, and looks at 143.233.222.64/255.255.255.192. Since (as I
suspected earlier), your subnet starts with .64, your IP range ends at
.127, not .255. Your router says, "Well we can't use that route", so it
checks the next one, which also does not match, and finally the last
entry, which also does not match. Having no default gateway, it discards
the packet and moves on.

iptables is not the issue - it is a routing problem. Either put the host
between .65 and .126 (.64 is your network address and .127 is supposed
to be broadcast), or change your routing table/network setup so you've
got a 255.255.255.0 network instead of a 255.255.255.192.

Derick Anderson

