From: "Javier Govea" <jgovea@magma.ca>
Subject: RE: Round Robin Load Balancing
Date: Sun, 17 Aug 2003 12:38:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308171638.h7HGcoOM009311@webmail1.magma.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: George Vieira <georgev@citadelcomputer.com.au>, Javier Govea <jgovea@magma.ca>, georgev@citadelcomputer.com.au
Cc: netfilter@lists.netfilter.org

Hi guys,

Well I tried the rules as you suggested, but this rule:

iptables -t nat -A PREROUTING -m connmark --mark 1 -j ROUTE --oif ppp0
...

give me an error: Invalid argument. According to this link:

http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE

the ROUTE target "has to be used inside the mangle table." So I can't use=
 it in the NAT
table.=20

The file mentioned by Geroge
(~georgev/iptables-1.2.7a/patch-o-matic/extra/ROUTE.patch.help) has an ex=
ample using ROUTE
with the NAT table. However this example seems to refer to iptables-1.2.7=
a. I am using
iptables-1.2.8. I don't think it's a good idea to go back to install an o=
lder version.
What do u guys think??

Any more suggestions or ideas????? All tips are very welcome...
Thanx to all
Xavier



On Aug 11, "George Vieira" <georgev@citadelcomputer.com.au> wrote:
>=20
> Hate to burst your bubble but isn't the ROUTE module being used a _litt=
le_ too late. I
mean, it's suppose to reroute to a new device but your using it in POSTRO=
UTING which means
it's to late to reroute it (basically leaving the interface and out to th=
e internet)...
>=20
> From memory, the ROUTE module is supposed to be used in PREROUTING on t=
he internal
interface so that it doesn't hit the routing table yet and the rule modif=
ies which
interface to go out on..
>=20
> I just did a search for the file :
~georgev/iptables-1.2.7a/patch-o-matic/extra/ROUTE.patch.help
> -----------------------------------------------------------------------=
---------
> Author: C=E9dric de Launois <delaunois@info.ucl.ac.be>
> Status: In Development/Works for me
>=20
>   This option adds a `ROUTE' target, which allows you to directly resen=
d
>   a received packet through a specified interface, even and especially
>   if the packet IP address is one of the router itself. Those packets
>   are locally delivered and cannot be forwarded to another computer
>   using the standard routing mechanisms.
>=20
>   ROUTE target v1.2.7 options:
>     --iface   name            Send the packet directly through iface na=
me.
>     --ifindex index           Send the packet directly through iface in=
dex.
>=20
>   Example :
>   You want to install a ssh server on a computer inside your network bu=
t
>   you also want it to appear exactly as if it was located on the router.
>   A solution is to simply reroute packets with destination port 22 to t=
he
>   computer having the same IP as the router and hosting the ssh service=
,
>   thanks to this ROUTE target and an ipip tunnel.
>=20
>   # iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 22 -j ROUTE --=
iface tunl1
>   # iptables -A PREROUTING -t nat -i tunl1 --j ROUTE --iface eth0
> -----------------------------------------------------------------------=
---------
> So my guess is that you need to change some lines eg:
>=20
> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ppp0-ip-a=
ddr>
> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ppp1-ip-a=
ddr>
> > iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source <ppp2-ip-a=
ddr>
> > iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source <ppp3-ip-a=
ddr>
> This appears to be OK.
>=20
> > iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state=
 --state new  -j
CONNMARK --set-mark 1
> > iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state=
 --state new  -j
CONNMARK --set-mark 2
> > iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state=
 --state new  -j
CONNMARK --set-mark 3
> > iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state=
 --state new  -j
CONNMARK --set-mark 4
> This _might_ be OK.. as long as it works and marks them.
>=20
> > iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state=
 --state new  -j
CONNMARK --set-mark 1
> > iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state=
 --state new  -j
CONNMARK --set-mark 2
> > iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state=
 --state new  -j
CONNMARK --set-mark 3
> > iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state=
 --state new  -j
CONNMARK --set-mark 4
> This only gets used by the local machine itself but usefull also if you=
r SQUID and
transparent proxy.
>=20
> > iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif=
 ppp1
> > iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif=
 ppp2
> > iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif=
 ppp3
> > iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif=
 ppp0
> This should be replaced by the lines below (I think..)..
>=20
>  iptables -t nat -A PREROUTING -m connmark --mark 1 -j ROUTE --oif ppp1
>  iptables -t nat -A PREROUTING -m connmark --mark 2 -j ROUTE --oif ppp2
>  iptables -t nat -A PREROUTING -m connmark --mark 3 -j ROUTE --oif ppp3
>  iptables -t nat -A PREROUTING -m connmark --mark 4 -j ROUTE --oif ppp0
>=20
> Give this a try but I don't know if all of this is right and there's no=
thing else
missing... looks OK.
>=20
> Also, when testing use telnet and don't use a browser.. makes it easier=
 to debug whereas
a browser pulls up to 20 connections and hard to figure out. Just telnet =
to a specific
host on the internet and use tcpdump on that host to see where the packet=
s are routing
through..
>=20
> Good luck.
>=20
>=20
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>=20
> Citadel Computer Systems Pty Ltd
> <a href=3D'http://www.citadelcomputer.com.au'>http://www.citadelcompute=
r.com.au</a>
>=20
>=20
> -----Original Message-----
> From: Javier Govea [mailto:jgovea@magma.ca]
> Sent: Monday, August 11, 2003 5:08 AM
> To: Ramin Dousti; Javier Govea
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Round Robin Load Balancing
>=20
>=20

