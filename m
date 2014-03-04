From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Multipath routing x kernel > 3.6 (without routing cache)
Date: Tue, 04 Mar 2014 12:56:37 +0400
Message-ID: <1393923397.15202.5.camel@rybalov.eng.ttk.net>
References: <CACuyg26ntrABcy39_Obtf+cUKMnOcMtwoE45ZEJkdR=WtwvPdA@mail.gmail.com>
	 <CACuyg25Jzj6VAXhTOj3sz4TYaP6Y13vAhwVEPyer6M3LBcGHSw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACuyg25Jzj6VAXhTOj3sz4TYaP6Y13vAhwVEPyer6M3LBcGHSw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Humberto =?ISO-8859-1?Q?Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D0=BD, 03/03/2014 =D0=B2 13:54 -0400, Humberto Juc=C3=A1 =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi,
>=20
> I made some adjustments this week and i will do more tests to see if
> it was good LB.
> So... i trie something like this:
>=20
> 1. Routing rules (RPDB and FIB)
>=20
> ip route add default via <gw_1> lable link1
> ip route add <net_gw1> dev <dev_gw1> table link1
> ip route add default via <gw_2> table link2
> ip route add <net_gw2> dev <dev_gw2> table link2
>=20
> /sbin/ip route add default  proto static scope global table lb \
>  nexthop  via <gw_1> weight 1 \
>  nexthop  via <gw_2> weight 1
>=20
> ip rule add prio 10 table main
> ip rule add prio 20 from <net_gw1> table link1
> ip rule add prio 21 from <net_gw2> table link2
> ip rule add prio 50 fwmark 0x301 table link1
> ip rule add prio 51 fwmark 0x302 table link2
> ip rule add prio 100 table lb
>=20
> ip route del default
>=20
>=20
> 2. Firewall rules (using ipset to force a "flow" LB mode)
>=20
> ipset create lb_link1 hash:ip,port,ip timeout 1200
> ipset create lb_link2 hash:ip,port,ip timeout 1200
>=20
> # Set firewall marks and ipset hash
> iptables -t mangle -N SETMARK
> iptables -t mangle -A SETMARK -o <if_gw1> -j MARK --set-mark 0x301
> iptables -t mangle -A SETMARK -m mark --mark 0x301 -m set !
> --match-set lb_link1 src,dstport,dst -j SET \
>           --add-set lb_link1 src,dstport,dst
> iptables -t mangle -A SETMARK -o <if_gw2> -j MARK --set-mark 0x302
> iptables -t mangle -A SETMARK -m mark --mark 0x302 -m set !
> --match-set lb_link2 src,dstport,dst -j SET \
>           --add-set lb_link2 src,dstport,dst
>=20
> # Reload marks by ipset hash
> iptables -t mangle -N GETMARK
> iptables -t mangle -A GETMARK -m mark --mark 0x0 -m set --match-set
> lb_link1 src,dstport,dst -j MARK --set-mark 0x301
> iptables -t mangle -A GETMARK -m mark --mark 0x0 -m set --match-set
> lb_link2 src,dstport,dst -j MARK --set-mark 0x302
>=20
> # Defining and save firewall marks
> iptables -t mangle -N CNTRACK
> iptables -t mangle -A CNTRACK -o <if_gw1> -m mark --mark 0x0 -j SETMA=
RK
> iptables -t mangle -A CNTRACK -o <if_gw2> -m mark --mark 0x0 -j SETMA=
RK
> iptables -t mangle -A CNTRACK -m mark ! --mark 0x0 -j CONNMARK --save=
-mark
> iptables -t mangle -A POSTROUTING -j CNTRACK
>=20
> # Reload all firewall marks
> # Use OUTPUT chain for local access (Squid proxy, for example)
> iptables -t mangle -A OUTPUT -m mark --mark 0x0 -j CONNMARK --restore=
-mark
> iptables -t mangle -A OUTPUT -m mark --mark 0x0 -j GETMARK
> iptables -t mangle -A PREROUTING -m mark --mark 0x0 -j CONNMARK --res=
tore-mark
> iptables -t mangle -A PREROUTING -m mark --mark 0x0 -j GETMARK
>=20
> Apparently it's working as I would like.
> Thanks
>=20
> 2014-03-02 9:09 GMT-04:00 Humberto Juc=C3=A1 <betolj@gmail.com>:
> > Hi,
> >
> > This issue has already been discussed here, but we have not reached=
 a
> > conclusion. I'm reviewing my firewall script (iptables yet) and I
> > would like to review the configuration of link load balancing.
> >
> > The problem is that setting too complicated without the routing cac=
he.
> >
> > With cache I could set a per-flow balancing. To do this, i configur=
ed
> > "gc_interval" as 1 and defined a higher value for "gc_timeout". Thu=
s I
> > forced distribution by origin and destination every second (1s), bu=
t
> > the routing path was maintained by "gc_timeout".
> >
> > This was the best way I found to balancing Internet links. IMHO, th=
is
> > worked well because it was a flow load balance. So, my connection
> > could be distributed by different links, but not in a short time to
> > the same destination. This avoided problems with HTTS sessions or
> > webmail, for example.
> >
> > From what I understand... without routing cache, i need to do a
> > firewall configuration via CONNMARK. To do this its simple. However
> > this creates a balancing per connection, not per flow. I didn't lik=
e
> > to see a routing path changed in a https session - In many cases,
> > local socket is changed constantly.
> >
> > I know that I can set the path for certain cases by the firewall ru=
le,
> > but that would be too much unproductive.
> >
> > I don't understand why such a radical step in the kernel code. Woul=
d
> > have been much better to have the possibility to enable or disable =
the
> > routing cache instead of removing the code completely. Recently I
> > needed to return the kernel version of one firewall (I need to revi=
ew
> > my scripts first).
> >
> > How do the load balancing per flow without routing cache?
> > Any ideas?

Just an idea. Grab HMARK in prerouting, use this mark to select routing
table. Then in input/output/forward/postrouting chains you can re-use
fwmark for queue selection or anything else.

> >
> > Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


