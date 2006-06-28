From: Admin <netfilter-info@internode.com.au>
Subject: Re: troublesome load balancing and iptables to the rescue...maybe
Date: Wed, 28 Jun 2006 18:28:42 +0930
Message-ID: <200606281828.42641.netfilter-info@internode.com.au>
References: <200606271947.38079.netfilter-info@internode.com.au>
	<44A15BDA.7020100@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44A15BDA.7020100@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wednesday 28 June 2006 01:54, Pascal Hambourg wrote:
> Hello,
>
> Admin a =E9crit :
> > We have a load balanced set of web servers (behind an alteon AD3) which
> > all work fine - except when the real servers (the webserver instances on
> > the load balanced machines) try to access the virtual ip (vip) on the
> > alteon.
>
> [...]
>
> > So the alteon substitutes the virtual server ip with the real server one
> > and back again for the load balancing to work.
>
> This looks like good old DNAT.

yep.

> > Now the problem, we need the real servers to be able to access the
> > service provided on the VIP also. The ports on the alteon are configured
> > properly (client and server enable and so on) but the problem seems to =
be
> > a routing one.
> >
> > Here's the flow of traffic when the real server tries to access the vip
> >
> > # client request
> > (client) -> (vip) - sip=3DCC, dip=3DBB
> > (vip) -> (real_server) - sip=3DCC, dip=3DCC
> > # return traffic (real server on CC responds to client on CC - oops
> > that's me) (real_server) -- sip=3DCC, dip=3DCC --> straight back to the=
 real
> > server, no dice.
> >
> > Now this is a common problem
>
> Yes, rather common when the client and the DNAT target are inside the
> same LAN.
>
> If you can tolerate that each server send the request to itself, it's
> easy. Something like this will locally redirect connections to the VIP
> to the server's own address :
>
> iptables -t nat -A OUTPUT -d <vip> -j DNAT --to <own_ip>

Unfortunately we also have ISD units (hardware SSL offloaders) attached to =
the=20
alteon, so the web servers themselves don't do SSL. Thus if a real server=20
tried to make a HTTPS connection this wouldn't work (since the traffic need=
s=20
to be processed by the alteon rather than just redirected back to the real=
=20
server.)

> Else, if the alteon can do SNAT (source NAT), this is the usual
> workaround to this problem. You can masquerade the servers subnet with
> VIP. Written in iptables style :
>
> iptables -t nat -j POSTROUTING -s <servers_subnet> -d <servers_subnet> \
>    -j SNAT --to <vip>
>
> But this method hides the original source server address on the
> destination server. If you need this information, you can do a static
> SNAT 1:1 mapping between each server address and a unique address chosen
> into an unused subnet which is distinct from the servers subnet. You
> won't have the real address in the logs but at least an address that
> uniquely identifies the source server. Again in iptables style :
>
> iptables -t nat -j POSTROUTING -s <server1> -d <servers_subnet> \
>    -j SNAT --to <alias1>
> iptables -t nat -j POSTROUTING -s <server2> -d <servers_subnet> \
>    -j SNAT --to <alias2>
>
> and so on. Or, more concisely :
>
> iptables -t nat -j POSTROUTING -s <servers_subnet> -d <servers_subnet> \
>    -j NETMAP --to <alias_subnet>

I'll try this one out when the alteon guru returns from his break.

> > I have been trying to find a way to mangle the packets with iptables (on
> > the real servers) to make this work.
> >
> > The obvious (well...kinda obvious) way is to change the sip (to somethi=
ng
> > outside the local network)  on the incoming packet somewhere in the
> > PREROUTING or INPUT phase, then modify the dip in the response packet in
> > the POSTROUTING phase back to that of the real server.
> >
> > Unfortunately this is pretty much the reverse of what DNAT and SNAT are
> > used for.
> >
> > We want SNAT on the PREROUTING or INPUT phase and DNAT in the POSTROUTI=
NG
> > (or possibly OUTPUT, but I don't think so) one.
>
> The reason why this is not possible is that routing would probably be
> disrupted.
>
> > Or perhaps - is there any way to force traffic from one IP to the same =
IP
> > to go through a remote router?
>
> That kind of traffic is for a local delivery, and the 'local' routing
> table has precedence over all other routing tables. Anyway why would
> there be traffic from one IP to the same IP ?
>
> > Perhaps mark traffic from the real server to the
> > vip then act on that mark when the alteon directs it back?
>
> A mark is a local information, and is lost as soon as the packet leaves
> the box. But you can alter return traffic this way (what you actually
> need). Remember, the wrong part is that replies go back directly to the
> client instead of going through the alteon. So iptables will first mark
> the packets we're interested in, assuming your servers listen only on
> TCP port 80 :
>
> iptables -t mangle -A OUTPUT -d <servers_subnet> -p tcp --sport 80 \
>    -m state --state ESTABLISHED -j MARK --set-mark <mark_value>
>
> A routing rule will direct the marked packets to an alternate table :
>
> ip rule add fwmark <mark_value> lookup <table_id>
> ip route add default via <vip> table <table_id>

So for example - assuming 192.168.1.0/24 as the servers_subnet (ignore that=
=20
this is private address space)

realServerA=3D192.168.1.10
realServerB=3D192.168.1.11
VIP=3D192.168.1.1

the procedure would be:
o Compile the kernel with iptables support plus...
   * IP: advanced router
   * IP: policy routing
     * IP: use netfilter MARK value as routing key
echo '80 web' >> /etc/iproute2/rt_tables
iptables -t mangle -A OUTPUT -d 192.168.1.0/24 -p tcp --sport 80 \
=2Dm state --state ESTABLISHED -j MARK --set-mark 200
ip rule add fwmark 200 lookup web
ip route add default via 192.168.1.1 table web

With that applied, then a server running on port 80 on 192.168.1.10 should =
be=20
able to access the service on the vip on 192.168.1.1, which will get direct=
ed=20
back to 192.168.1.10 or 192.168.1.11. That request should then be returned =
to=20
the client on 192.168.1.10

It doesn't work yet (I'm still examining the packet dumps to try to work ou=
t=20
why)

Added a mark log to check on the match
iptables -t mangle -A OUTPUT -m mark --mark 200 -j LOG \
=2D-log-level DEBUG --log-prefix "fwmark 200: "

which show's the traffic from the health checks that come in from the alteo=
n,=20
and presumably the traffic from the real server to the vip when I try to ma=
ke=20
that connection.

> One alternative, although I personnaly find it very ugly : by-pass
> normal routing with the (experimental) ROUTE target, and force routing
> of the servers subnet via the alteon as a gateway.

Mmm...if I can't get the above working (which I haven't yet) then I'll give=
=20
this a try.

Thanks for the info

Admin

