From: "Tim Saunders" <Tim.Saunders@aquilauk.co.uk>
Subject: RE: UnNATing return packets
Date: Fri, 23 May 2003 08:49:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <081A08701BD5BA46ACEE07E9D8A60F871801E3@troy.win.aquilauk.co.uk>
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
To: netfilter@lists.netfilter.org

The LOG rules I put in PREROUTING and POSTROUTING aren't logging
anything!?! But I also put one in FORWARD and its logging the packets as
coming from the address DNAT change the original packets to go to and
destined for the original source address. This must mean the SNAT has
been undone when the return packets hit the FORWARD chain but the DNAT
will not be undone until the packets reach the POSTROUTING chain. This
seems like a bug to me, I would expect all NAT to be undone before any
routing takes place ideally before the prerouting chain.

I guess I will have to think of another way to implement multiple
incoming lines. Any suggestions would be appreciated. My first idea is
to run a UML instance so incoming packets go through the main linux
instance and are routed to the UML instance that NATs them, thus on the
return they are unNATed by the UML and passed to the main instance for
source routing. It sounds really nasty...

Tim

> -----Original Message-----
> From: George Vieira [mailto:georgev@citadelcomputer.com.au]=20
> Sent: 22 May 2003 22:49
> To: Tim Saunders; netfilter@lists.netfilter.org
> Subject: RE: UnNATing return packets
>=20
>=20
> In the prerouting stage I assume because that is the place=20
> where DNAT takes place. Also take note they say "PREROUTING"=20
> for a good reason though I haven't tested it with iproute2=20
> and source routing but I assume they are in the same level.=20
> Just remember that POSTROUTING is after the routing table..=20
> as it says in it's name (he he, gotta love those netfilter=20
> developers)..
>=20
> Add some LOG rules matching both sets of IPs your testing.
>=20
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>=20
> Citadel Computer Systems Pty Ltd http://www.citadelcomputer.com.au
>=20
> -----Original Message-----
> From: Tim Saunders [mailto:Tim.Saunders@aquilauk.co.uk]
> Sent: Friday, May 23, 2003 12:51 AM
> To: netfilter@lists.netfilter.org
> Subject: UnNATing return packets
>=20
>=20
> When a TCP connection goes through a netfilter firewall and=20
> is SNATed and DNATed when do the return packets get unNATed?=20
> i.e. a packet comes into the firewall from a client=20
> requesting a tcp session, it is SNATed and DNATed and sent to=20
> the server, the server sends and ack response, this gets to=20
> the firewall. When do the original source and destination=20
> addresses (from the session request packet) get put back? Is=20
> it before or after routing?
>=20
> I am trying to do source routing of return packets based on=20
> the address the client originally thought it was targeting.=20
> Packets come in destined for 80.5.94.150 and get DNATed to=20
> 10.136.1.7 they also get SNATed to 10.136.1.254. I have a=20
> rule to route packets from 80.5.94.150 via a different=20
> routing table with a default route that goes out of a=20
> differen't line to normal but the packets still get routed=20
> out of the normal line. It is possible my source routing is=20
> at fault. I am using the following commands:
>=20
> I have added "15  sr1" to /etc/iproute2/rt_tables.
>=20
> # ip rule add from 80.5.94.150 table sr1
> # ip route add default via 80.5.94.129 dev eth3 table sr1
> # ip route flush cache
>=20
> One more thing that may be important eth3 has an IP in=20
> 80.5.94.128/25 and an IP in 10.234.1.0/24 that goes to a=20
> router for the other line.
>=20
> Any help greatly appreciated.
> Tim Saunders
>=20
>=20

