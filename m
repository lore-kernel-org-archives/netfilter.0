From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: troublesome load balancing and iptables to the rescue...maybe
Date: Tue, 27 Jun 2006 18:24:58 +0200
Message-ID: <44A15BDA.7020100@plouf.fr.eu.org>
References: <200606271947.38079.netfilter-info@internode.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606271947.38079.netfilter-info@internode.com.au>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Admin a =E9crit :
>=20
> We have a load balanced set of web servers (behind an alteon AD3) which=
 all=20
> work fine - except when the real servers (the webserver instances on th=
e load=20
> balanced machines) try to access the virtual ip (vip) on the alteon.
[...]
> So the alteon substitutes the virtual server ip with the real server on=
e and=20
> back again for the load balancing to work.

This looks like good old DNAT.

> Now the problem, we need the real servers to be able to access the serv=
ice=20
> provided on the VIP also. The ports on the alteon are configured proper=
ly=20
> (client and server enable and so on) but the problem seems to be a rout=
ing=20
> one.
>=20
> Here's the flow of traffic when the real server tries to access the vip
>=20
> # client request
> (client) -> (vip) - sip=3DCC, dip=3DBB
> (vip) -> (real_server) - sip=3DCC, dip=3DCC
> # return traffic (real server on CC responds to client on CC - oops tha=
t's me)
> (real_server) -- sip=3DCC, dip=3DCC --> straight back to the real serve=
r, no dice.
>=20
> Now this is a common problem

Yes, rather common when the client and the DNAT target are inside the=20
same LAN.

If you can tolerate that each server send the request to itself, it's=20
easy. Something like this will locally redirect connections to the VIP=20
to the server's own address :

iptables -t nat -A OUTPUT -d <vip> -j DNAT --to <own_ip>

Else, if the alteon can do SNAT (source NAT), this is the usual=20
workaround to this problem. You can masquerade the servers subnet with=20
VIP. Written in iptables style :

iptables -t nat -j POSTROUTING -s <servers_subnet> -d <servers_subnet> \
   -j SNAT --to <vip>

But this method hides the original source server address on the=20
destination server. If you need this information, you can do a static=20
SNAT 1:1 mapping between each server address and a unique address chosen=20
into an unused subnet which is distinct from the servers subnet. You=20
won't have the real address in the logs but at least an address that=20
uniquely identifies the source server. Again in iptables style :

iptables -t nat -j POSTROUTING -s <server1> -d <servers_subnet> \
   -j SNAT --to <alias1>
iptables -t nat -j POSTROUTING -s <server2> -d <servers_subnet> \
   -j SNAT --to <alias2>

and so on. Or, more concisely :

iptables -t nat -j POSTROUTING -s <servers_subnet> -d <servers_subnet> \
   -j NETMAP --to <alias_subnet>

> I have been trying to find a way to mangle the packets with iptables (o=
n the=20
> real servers) to make this work.
>=20
> The obvious (well...kinda obvious) way is to change the sip (to somethi=
ng=20
> outside the local network)  on the incoming packet somewhere in the=20
> PREROUTING or INPUT phase, then modify the dip in the response packet i=
n the=20
> POSTROUTING phase back to that of the real server.
>=20
> Unfortunately this is pretty much the reverse of what DNAT and SNAT are=
 used=20
> for.
>
> We want SNAT on the PREROUTING or INPUT phase and DNAT in the POSTROUTI=
NG (or=20
> possibly OUTPUT, but I don't think so) one.

The reason why this is not possible is that routing would probably be=20
disrupted.

> Or perhaps - is there any way to force traffic from one IP to the same =
IP to=20
> go through a remote router?

That kind of traffic is for a local delivery, and the 'local' routing=20
table has precedence over all other routing tables. Anyway why would=20
there be traffic from one IP to the same IP ?

> Perhaps mark traffic from the real server to the=20
> vip then act on that mark when the alteon directs it back?

A mark is a local information, and is lost as soon as the packet leaves=20
the box. But you can alter return traffic this way (what you actually=20
need). Remember, the wrong part is that replies go back directly to the=20
client instead of going through the alteon. So iptables will first mark=20
the packets we're interested in, assuming your servers listen only on=20
TCP port 80 :

iptables -t mangle -A OUTPUT -d <servers_subnet> -p tcp --sport 80 \
   -m state --state ESTABLISHED -j MARK --set-mark <mark_value>

A routing rule will direct the marked packets to an alternate table :

ip rule add fwmark <mark_value> lookup <table_id>
ip route add default via <vip> table <table_id>

One alternative, although I personnaly find it very ugly : by-pass=20
normal routing with the (experimental) ROUTE target, and force routing=20
of the servers subnet via the alteon as a gateway.

