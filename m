From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: DNAT + 2 uplinks + route = nogo
Date: Thu, 16 Oct 2003 11:24:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E1296037@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>
Cc: Jim Carter <jimc@math.ucla.edu>

Unfortunatly, that is not a feature, it's mistake. Most providers I =
know, including the two involved here filter any and all packets that =
have a source IP other than the address range handed out by them. No =
traffic will therefore go out.

You have, however, convinced me that there can be cases where you want =
traffic going up one creek, and down the other ;-).

As I just sent to the list, I'm going to try out some things now.

Gaby Schilders
IBFD network admin

-----Original Message-----
From: Jim Carter [mailto:jimc@math.ucla.edu]
Sent: woensdag 15 oktober 2003 19:05
To: Gaby Schilders
Cc: netfilter list; Ray Leach
Subject: RE: DNAT + 2 uplinks + route =3D nogo


On Wed, 15 Oct 2003, Gaby Schilders wrote:

> - packets coming in over both lines are correctly DNATted (the rules
> match and their count goes up). these packets now have a src-ip of the
> originating host but the private address of the DNATted server as =
dst-ip
> and are routed to the internal interface. So far, so good.

> - the return packets for connections over both lines go to the linux
> box's internal interface with the private address of the DNATted =
server
> as src-ip and the originating host as dst-ip. How must the Linux box
> discern these packets and how does it decide to send the replies =
through
> which line? Same goes for the ROUTE target: what matching criteria =
would
> you use to discern the packets? Both packets come from the same src =
(at
> that moment of matching, UnDNATting is the last step of all), both =
have
> the same destination, both have the same incoming interface (the =
internal
> interface).

Do I understand the malfunction correctly?  The router has external
interfaces eth1 =3D 1.2.3.4 and eth2 =3D 2.3.4.5.  A global internet =
client,
let's say 128.97.4.125, connects to a certain port on 2.3.4.5.  The
connection is DNATted to an internal server, which replies to =
128.97.4.125.
The router un-DNATs it and now has a packet allegedly "from" 2.3.4.5's
special port, "to" 128.97.4.125.

The complaint is that the packet is then sent out eth1, when the =
incoming
connection was on eth2.

I think "that's not a bug, that's a feature" :-)  If eth1 truly cannot
reach 128.97.4.125, the route assigned through it should reflect the
subnets that it can reach.  If it's a cost or political issue which
interface is used, I have no experience in the "right" way to deal with
that (TOS?), but if you set a high metric on the less preferred route,
that is definitely honored for ordinary packets.  If the issue is load
balancing, I've heard of people doing advanced routing stuff to make =
that
happen, but again I have no experience myself.

Another person suggested CONNMARKing the connection according to the
incoming interface, and then using ROUTE (from P-O-M) to preempt the
routing decision.  It should work, but also should not be necessary --
nothing will actually break if different routes are used.  Unless there =
are
two other NAT boxes involved which depend on bidirectional traffic to
recognize throughgoing connections.  But that's really unlikely.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  =
90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for =
PGP key)

