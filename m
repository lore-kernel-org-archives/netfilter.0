From: "Bill Binko" <Bill.Binko@trcinc.com>
Subject: RE: redirection with squid
Date: Mon, 14 Apr 2003 19:46:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3BAC15E02315BC4783152AC5E9621BB502151A1A@trcexcsrv01.trcinc.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

First, make sure that Squid is setup for transparent operation: I would
bet that it is not, given that you can access it by setting the proxy to
3128 manually:
http://www.squid-cache.org/Doc/FAQ/FAQ-17.html


Once that is setup, you may have another problem:  if you are not
getting responses to your requests, but the requests are making to
squid, try this:

You MAY be correctly DNATting your packets to the proxy, but the replies
are not going through the gateway, they are being routed direct, since
they are on the same private subnet.  A solution to this is to use a
matching SNAT rule like this:

iptables -t nat -A PREROUTING -i $INT_IF -p tcp --dport 80 -s
$INT_NET/24 -j DNAT --to ${SQUID_INT_ADDR}:3128
iptables -t nat -A POSTROUTING -o $INT_IF -p tcp --dport 3128 -d
$SQUID_INT_ADDR/24 -j SNAT --to $GATEWAY_EXT_ADDR

That way, the return packets will be forced to go through the gateway,
and will be correctly routed.  (You MIGHT be able to get away with using
$GATEWAY_INT_ADDR in the second line, but I'm not sure... My
not-too-different setup uses the external address for DNS reasons).


However, this is a horrible solution to a problem where there is a good
one!

Setup a standard auto proxy config file, and setup the appropriate WPAD
environment.  Here's a link to how:
http://www.squid-cache.org/Doc/FAQ/FAQ-5.html#ss5.10
You can even look here for really detailed examples:
http://naragw.sharp.co.jp/sps/

Just to be clear, this isn't just "the right way": your cache will
perform MUCH BETTER using this setup than a simple transparent proxy!
The reason is simple: in a transparent proxy, the client DOESN'T KNOW
its talking to a proxy!  That means that it CANNOT adjust its caching
policy to take that into effect!  That means that your choice of refresh
option (always, once, auto) can result in either stale pages or no
caching on the client.

You can always leave the transparent proxy in place for those machines
you don't control, or where users reset the default policy.  However,
you should log those and try to minimize them, as it is a real
performance hit and will throw off your caching results.

Hope this helps,
Bill


> -----Original Message-----
> From: Mike [mailto:mikeeo@msn.com]=20
> Sent: Monday, April 14, 2003 4:00 PM
> To: netfilter@lists.netfilter.org
> Subject: redirection with squid
>=20
>=20
> I have read the transparency How-To  and it doesn't apply to=20
> my situation. I have a linux gateway that is also the default=20
> route for all workstations. I also have a linux box running=20
> squid that has 2 interfaces one private and one internet=20
> routable. So far I haven't been able to redirect my clients=20
> to the squid box. Lay out:
>=20
>         inet----linuxgateway----(private IP)
>                         |
>                         |
>                     squid<eth1>----(privateIP)
>=20
> the squid box has a routeable internet IP for eth0 and a=20
> private IP for eth1
> (192.168.1.0) in fact both squid and linuxgateway have=20
> private 192.168.1.0 networks. I just need to redirect packets=20
> with destination port 80 to the squid box so it gets proxied=20
> out. If I change my broswer proxy to squid:3128 works fine.=20
> Im thinkin policy routing maybe?
>=20
> Thanks,
> Mike
>=20
>=20
>=20

