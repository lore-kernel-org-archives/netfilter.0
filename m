From: "Aldo Lagana" <ALagana@p21.com>
Subject: RE: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 11:26:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5EDC9B3CC8401E4184D3B43B75A75C2B46D668@mx.p21.com>
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
To: simpsonb@hillsboroughcounty.org, netfilter@lists.netfilter.org

am i wrong or can you not send traffic to another server simply with =
netfilter/iptables rules?  Does not that require iproute2?  In other =
words don't all of the rules assume that the NAT addresses are bound to =
local interfaces?=20

aldo

-----Original Message-----
From: Brett Simpson [mailto:simpsonb@hillsboroughcounty.org]
Sent: Wednesday, June 23, 2004 11:12 AM
To: netfilter@lists.netfilter.org
Subject: Re: Send local traffic to a different server.


On Wed, 2004-06-23 at 10:00, Antony Stone wrote:
> On Wednesday 23 June 2004 3:33 pm, Brett Simpson wrote:
>=20
> > On Wed, 2004-06-23 at 09:33, Antony Stone wrote:
> > > On Wednesday 23 June 2004 3:08 pm, Brett Simpson wrote:
> > > > I've tried a number of different PREROUTING and POSTROUTING =
rules and
> > > > can't seem to make this work.
> > > >
> > > > I have a system with a single nic (eth0). While I'm on the =
system via a
> > > > shell I would like to connect to 127.0.0.1:6000 and get =
seemlessly
> > > > translated to 207.156.7.15:80.
> > > >
> My rule will send packets to 207.156.7.15 with a source address of =
127.0.0.1
>=20
> Not surprisingly, you don't get anything back...
>=20
> Try:
>=20
> iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT =
--to=20
> 207.156.7.15:80
> iptables -A POSTROUTING -t nat -p tcp --dport 80 -d 207.156.7.15 -s =
127.0.0.1=20
> -j SNAT --to a.b.c.d
>=20
> Where a.b.c.d is the routable address of your machine, to which reply =
packets=20
> can successfully return.

Still no go. My machine is 172.27.228.145. I'm using lynx for the
browser on my machine.

iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to
207.156.7.15:80
iptables -A POSTROUTING -t nat -p tcp --dport 80 -d 207.156.7.15 -s
127.0.0.1 -j SNAT --to 172.27.228.145

Thanks,
Brett





