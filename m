From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: UnNATing return packets
Date: Fri, 23 May 2003 07:48:41 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CB0@wardrive.citadelcomputer.com.au>
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
To: Tim Saunders <Tim.Saunders@aquilauk.co.uk>, netfilter@lists.netfilter.org

In the prerouting stage I assume because that is the place where DNAT =
takes place.
Also take note they say "PREROUTING" for a good reason though I haven't =
tested it with iproute2 and source routing but I assume they are in the =
same level. Just remember that POSTROUTING is after the routing table.. =
as it says in it's name (he he, gotta love those netfilter developers)..

Add some LOG rules matching both sets of IPs your testing.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Tim Saunders [mailto:Tim.Saunders@aquilauk.co.uk]
Sent: Friday, May 23, 2003 12:51 AM
To: netfilter@lists.netfilter.org
Subject: UnNATing return packets


When a TCP connection goes through a netfilter firewall and is SNATed
and DNATed when do the return packets get unNATed? i.e. a packet comes
into the firewall from a client requesting a tcp session, it is SNATed
and DNATed and sent to the server, the server sends and ack response,
this gets to the firewall. When do the original source and destination
addresses (from the session request packet) get put back? Is it before
or after routing?

I am trying to do source routing of return packets based on the address
the client originally thought it was targeting. Packets come in destined
for 80.5.94.150 and get DNATed to 10.136.1.7 they also get SNATed to
10.136.1.254. I have a rule to route packets from 80.5.94.150 via a
different routing table with a default route that goes out of a
differen't line to normal but the packets still get routed out of the
normal line. It is possible my source routing is at fault. I am using
the following commands:

I have added "15  sr1" to /etc/iproute2/rt_tables.

# ip rule add from 80.5.94.150 table sr1
# ip route add default via 80.5.94.129 dev eth3 table sr1
# ip route flush cache

One more thing that may be important eth3 has an IP in 80.5.94.128/25
and an IP in 10.234.1.0/24 that goes to a router for the other line.

Any help greatly appreciated.
Tim Saunders


