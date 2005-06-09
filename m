From: Matin Tamizi <mtamizi@gmail.com>
Subject: Re: Routing and DNAT redux
Date: Thu, 9 Jun 2005 12:22:45 -0400
Message-ID: <f68a41605060909226f26a9ba@mail.gmail.com>
References: <200506081754.50537.jsimmons@goblin.punk.net>
Reply-To: Matin Tamizi <mtamizi@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506081754.50537.jsimmons@goblin.punk.net>
Content-Disposition: inline
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
To: jsimmons@goblin.punk.net
Cc: netfilter@lists.netfilter.org

Why not use netfilter's SNAT and static routes via the route command?=20
You can use route to define the outgoing path for specific traffic:

For example:
route add -net 192.168.0.0 netmask 255.255.0.0 dev eth1

-Matin

On 6/8/05, Jeff Simmons <jsimmons@goblin.punk.net> wrote:
> OK, a little more specific.
>=20
> I have an iptables firewall with a server behind it. The server has a
> non-routable address (192.168) so the firewall's IP address:port is DNAT'=
d
> to the server's address:port.
>=20
> Incoming packets to the server first encounter the firewall's external
> interface (EXT_IF), where the prerouting DNAT rule rewrites the IP layer
> destination address (EXT_ADDR) to the server's address (SERV_ADDR). The
> packet is then passed on to the routing function, which determines that t=
he
> packet needs forwarding via the internal interface (INT_IF). The packet i=
s
> then passed through any appropriate iptables forwarding chains, then to t=
he
> post-routing function of iptables (which in this case does nothing), and
> finally out INT_IF to destination SERV_ADDR.
>=20
> There's a nice diagram of this at:
>=20
>  http://www.policyrouting.org/PolicyRoutingBook/ONLINE/CH03.web.html
>=20
> down in section 3.3.2.
>=20
> Now, to the reply from the server. When the packet leaves the server, its=
 IP
> layer will show source SERV_ADDR destination REMOTE_ADDR. But when the pa=
cket
> arrives at the remote, it will show source EXT_ADDR destination REMOTE_AD=
DR.
> It gets rewritten somewhere.
>=20
> My understanding is the rewriting is done by the state engine, which basi=
cally
> maintains a rule that any outbound packet SERV_ADDR:port -> REMOTE_ADDR:p=
ort
> gets changed to EXT_ADDR:port -> REMOTE_ADDR:port. But where in the chain
> does this happen?
>=20
> Scenario one: it happens on INT_IF prerouting. If this is the case, then =
I can
> use source routing with iproute2.
>=20
> Scenario two: it happens on EXT_IF postrouting. Then iproute2 can't do th=
e
> kind of source routing I need to do, and I'll have to find another soluti=
on.
>=20
> (Note that with standard destination routing, it doesn't matter where the
> packet gets rewritten. But with source routing it matters greatly.)
>=20
> The reality is, the box I'm working on has 4 T1s coming in, a DMZ with
> routable IP addresses, and two LANS with non-routable addresses where bot=
h
> contain servers that need to be contacted by the outside world via DNAT. =
It's
> a big, messy, ugly project, but I need to know if I can use iproute2 to b=
e
> sure that return packets from all the servers go out the T1 they came in =
on.
>=20
> Any help, pointers, or FMs that I can RTFM would be GREATLY appreciated.
>=20
> --
> Jeff Simmons                                   jsimmons@goblin.punk.net
>      Simmons Consulting - Network Engineering, Administration, Security
>=20
> "You guys, I don't hear any noise. Are you sure you're doing it right?"
>         -- My Life With The Thrill Kill Kult
>=20
>

