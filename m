From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: troublesome load balancing and iptables to the rescue...maybe
Date: Wed, 28 Jun 2006 13:44:23 +0200
Message-ID: <44A26B97.5040506@plouf.fr.eu.org>
References: <200606271947.38079.netfilter-info@internode.com.au>	<44A15BDA.7020100@plouf.fr.eu.org>
	<200606281828.42641.netfilter-info@internode.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606281828.42641.netfilter-info@internode.com.au>
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
To: Netfilter <netfilter@lists.netfilter.org>

Admin a =E9crit :
>
> So for example - assuming 192.168.1.0/24 as the servers_subnet (ignore =
that=20
> this is private address space)
>=20
> realServerA=3D192.168.1.10
> realServerB=3D192.168.1.11
> VIP=3D192.168.1.1
>=20
> the procedure would be:
> o Compile the kernel with iptables support plus...
>    * IP: advanced router
>    * IP: policy routing
>      * IP: use netfilter MARK value as routing key

Right, I always forget these functions are optional...

> echo '80 web' >> /etc/iproute2/rt_tables
> iptables -t mangle -A OUTPUT -d 192.168.1.0/24 -p tcp --sport 80 \
> -m state --state ESTABLISHED -j MARK --set-mark 200
> ip rule add fwmark 200 lookup web
> ip route add default via 192.168.1.1 table web
>=20
> With that applied, then a server running on port 80 on 192.168.1.10 sho=
uld be=20
> able to access the service on the vip on 192.168.1.1, which will get di=
rected=20
> back to 192.168.1.10 or 192.168.1.11. That request should then be retur=
ned to=20
> the client on 192.168.1.10

Oops, I just realized that for several reasons it won't work when the=20
alteon redirects a connection to the same server.

> It doesn't work yet (I'm still examining the packet dumps to try to wor=
k out=20
> why)

Ok. Check the packet MAC addresses on both servers.

> Added a mark log to check on the match
> iptables -t mangle -A OUTPUT -m mark --mark 200 -j LOG \
> --log-level DEBUG --log-prefix "fwmark 200: "
>=20
> which show's the traffic from the health checks that come in from the a=
lteon,

Huh ? This rule is in the OUTPUT chain, so it shouldn't log incoming=20
packets from the alteon.

> and presumably the traffic from the real server to the vip when I try t=
o make=20
> that connection.

Rather the return traffic from the target server to the source server.

