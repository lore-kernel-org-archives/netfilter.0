From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 15:55:25 -0500
Message-ID: <002d01c53aea$f577baf0$f5001eac@riverview.office>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de><001b01c53adc$d8c7b530$f5001eac@riverview.office>
	<20050406194635.GE12284@torres.l21.ma.zugschlus.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Marc Haber <mh+netfilter@zugschlus.de>, netfilter@lists.netfilter.org

> That will have me send out packets with source A to ISP B and vice
> versa which will have the packets killed by the ISPs reverse path
> filters.

Presuming that I got the IP addresses for ISP A matched up with the
interface for ISP A and vice versa for ISP B then all packets that go out to
the respective ISPs will have the correct sorce address.  ECMP is especialy
designed for situations where people have multiple default routes or
multiple internet connections.  Keep in mind that SNATing happens AFTER the
routing decition takes place in the kernel as the traffic is headed OUT the
physical interface.  With this in mind what ever interface the kernel
decides to send the traffic out will be SNATed with the appropriet IP for
that interface.

> This will NAT the first, third, fifth packet of a TCP session to
> 172.16.0.129 and the second, fourth and sixth packet of the same
> session to 10.0.0.1. I seriously doubt that the session will come up
> at all.

No it will not.  ECMP creates a pairing of source IP, source port,
destination IP, and destination port and maintains each pairing on one route
out for the duration of the session.  Or at least that is what it is suppose
to do.  This way you may have an SSH session from an internal client go out
ISP A and an HTTP request to the same destination system go out ISP B but
each TCP stream / conversation will alwayse go out the same interface that
it started going out. (There is a cache involved in the routing decition but
that is for how long the decition is remembered AFTER the strem terminates,
and is also tunable via /proc)



Grant. . . .


