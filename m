From: <bmcdowell@coxhealthplans.com>
Subject: RE: iptables abilities
Date: Fri, 23 Jan 2004 13:48:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BE940@coxhpexg.coxhp.com>
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


Are you by any chance referring to the phenomenon where everyone in the
world uses 192.168.1.0/24 as their internal subnet?  Wherein even if you
can get the two private subnets linked together routing fails to happen?

If so, I don't think there's a solution.  Or not a good one at any rate.
If you could guarantee unique addresses at each end, you might be able
to pull something off with a bridge.  Or, perhaps you could use some
NAT-magic to add 100 to the foreign IP's while in transit.  (By that I
mean make .1 equal to .101 on the other network.)  Still though, this is
a bad idea.  One out-of-scope IP would kill a setup of this type.  And,
since changing one subnet or the other is probably the first idea people
get when faced with this, I'd guess you can't control the scopes.

Or, maybe I misunderstood.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Sven Burgener
Sent: Friday, January 23, 2004 4:24 AM
To: netfilter@lists.netfilter.org
Subject: Re: iptables abilities


Antony Stone wrote:
> The only reason you can't route private addresses across the Internet
is that=20
> all ISP routers drop packets sent to these address ranges.

Right.

> You would set up your VPN system to forward these packets, just the
same as=20
> you can set up your own firewalls and routers to forward them if you
want to.
>=20
> A VPN with two RFC1918 ranges at each end is a very common setup.

Yes, indeed.

My question, though, is how can a connection be established between two=20
parties where one of them has a private address (A) and where you want=20
to connect _to_ the server having the private address (A, see below).

The problem is, you can't establish a connection to the private address=20
(A), so there has to be a means of 'hijacking' the established session=20
(from X, see diagram below).


         (Internet)       (Internet)
     A <------------> X <------------> B

A: 192.168.X.X
B: 192.168.X.X
X: public IP address

The end result is to get from B to A, securely.

Cheers
Sven

