From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Combined Internal/External DNAT question
Date: Sun, 15 May 2005 09:35:59 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829073A0@pxtbenexd01.pxt.primeexalia.com>
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
To: Jonathan Wheeler <griffous@griffous.net>, netfilter@lists.netfilter.org

I've always received an answer which has never helped for this question
of this not being necessary.  Anyways, here is what we do that does work
which I'm sure you can change to suit your needs.

-A POSTROUTING -s 10.0.0.130 -o eth0 -j SNAT --to-source 30.40.50.130=20
-A POSTROUTING -s 10.0.0.0/255.255.255.0 -d 10.0.0.130 -j SNAT
--to-source 30.40.50.130

eth0 is the external interface for some reason we loose the second line
internal machines cannot access other internal machines with the
external IP.  I've had mixed results dropping the eth0 on the first
line.  If I recall internal hosts pinging internal hosts on their
internal or external IP would always respond with their external IP
which also screwed things up.

It should be similar for you but with ports specified.

Hope that helps,=20

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Jonathan Wheeler
> Sent: Friday, May 13, 2005 10:52 PM
> To: netfilter@lists.netfilter.org
> Subject: Combined Internal/External DNAT question
>=20
> Hi Guys,
>=20
> I have a number of internal servers sitting behind my iptables
firewall
> running various services (smtp/http/dns etc).
> My public IP address sits on my DSL router's WAN interface, which nats
> the specified ports for my public services to the firewall's interface
&
> IP which is attached to the router via crossover cable.
>=20
> Iptables has about 15 entries all along the lines of
>=20
> iptables -t nat -A PREROUTING -d 10.0.0.1 -i eth1 -p tcp --dport
> <tcpservice> -j DNAT --to <relevant.internal. server>:<tcpservice>
> And this works nicely.
>=20
> However I have the classic situation of internal clients using the DNS
> entries for these servers which points them to my external IP. The
> firewall forwards the traffic out the dsl interface to the internet as
> it has no knowledge of my public IP. It doesn't work, the DSL router
> can't NAT to and from the LAN interface.
>=20
> The following documentation is close to what I want, but doesn't quite
> work.
> http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html
>=20
> The reason it doesn't work is that my firewall doesn't actually have
the
> external IP.
>=20
> What I need is rule along the lines of:
> iptables -t nat -I PREROUTING -d <publicIP> -s <internal-lan> -j DNAT
> --to 10.0.0.1.
> I would then have traffic from the internal lan, going the same
> destination IP that my public natting rules are already built for.
Which
> should then redirect internal clients to my internal servers using
these
> same natting rules.
>=20
> It appears however that once iptables had done it's initial DNAT of a
> session as per the rule above, it doesn't reevalute the PREROUTING
chain.
>=20
> Which means that clients try to connect to the firewall itself rather
> then being DNATed again.
>=20
> HELP, I need some kind of a double DNAT?
>=20
> I know there are solutions to this problem like dual dns, but getting
> this would be MUCH quicker to setup/manage/scale, and I wouldn't have
to
> play DNS games.
>=20
> I could also create a whole second set of rules DNATing internal
traffic
> destined for my public IP, to go to the correct server, but then I'd
> have 2 chains of traffic to maintain. Is there no way I can do this
all
> with one set of rules, on the one firewall?
>=20
> Thanks,
> Jonathan.


