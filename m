From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: DUAL wan issue, destination-based routing
Date: Wed, 28 May 2008 23:50:06 +0200 (CEST)
Message-ID: <59790.84.123.239.190.1212011406.squirrel@www.arcoscom.com>
References: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com>
    <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com>
    <483CE789.40806@trash.net>
    <alpine.LNX.1.10.0805281350010.1470@fbirervta.pbzchgretzou.qr>
    <840713630805281326i59d129bch27e06228295feef2@mail.gmail.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <840713630805281326i59d129bch27e06228295feef2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Perhaps you can read a bit more about multilinks here:

http://lartc.org.

You can take the example given previously and the info in lartc to make
your own rules.

As an example, I have this output for my linux box that uses 3 lines:
=3D=3D=3D REGLAS IPTABLES PARA EL ENRUTADO =3D=3D=3D
Chain PREROUTING (policy ACCEPT 18M packets, 14G bytes)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      16M   12G M_TRAF_IN  all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
2    2520K 1867M M_IFACE    all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
Chain M_IFACE (1 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1    1265K  166M CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
2    1403K 1710M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000
3    1117K  158M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0       =
  =20
 0.0.0.0/0           MARK match 0x0/0xf000
4     7275  371K MARK       all  --  eth1   *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x4000
5     9839  514K MARK       all  --  eth2   *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
6     9164  480K MARK       all  --  eth3   *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
7    26278 1365K CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
8    1117K  158M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
Chain M_IFACE_TRAF (2 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
Chain POSTROUTING (policy ACCEPT 20M packets, 14G bytes)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      17M   13G M_TRAF_OUT  all  --  *      *       0.0.0.0/0         =
 =20
0.0.0.0/0
2    2744K 1934M M_IFACE_OUT  all  --  *      *       0.0.0.0/0        =
  =20
0.0.0.0/0
Chain M_IFACE_OUT (1 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1    2572K 1848M CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
2    1079K  135M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000
3    1665K 1794M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0       =
  =20
 0.0.0.0/0           MARK match 0x0/0xf000
4     6830  410K MARK       all  --  *      eth1    0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x4000
5     5559  331K MARK       all  --  *      eth2    0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
6    14689  871K MARK       all  --  *      eth3    0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
7    27078 1612K CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
8    1665K 1794M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
=3D=3D=3D REGLAS DE ENRUTAMIENTO =3D=3D=3D
0:      from all lookup local
50:     from all lookup main
100:    from all fwmark 0x4000/0xf000 lookup uno
101:    from all fwmark 0x2000/0xf000 lookup dos
102:    from all fwmark 0x8000/0xf000 lookup tabla_eth3
150:    from 212.170.103.236 lookup uno
151:    from 212.170.103.235 lookup dos
152:    from 212.59.210.142 lookup tabla_eth3
200:    from all lookup defecto
32766:  from all lookup main
32767:  from all lookup default
=3D=3D=3D TABLAS DE RUTAS =3D=3D=3D
=3D=3D=3D MAIN =3D=3D=3D
212.170.103.192/26 dev eth2  proto kernel  scope link  src 212.170.103.=
235
212.170.103.192/26 dev eth1  proto kernel  scope link  src 212.170.103.=
236
192.168.3.0/24 dev zlan0  proto kernel  scope link  src 192.168.3.247
192.168.2.0/24 dev zlan0  proto kernel  scope link  src 192.168.2.247
192.168.1.0/24 dev zlan0  proto kernel  scope link  src 192.168.1.247
212.59.210.0/24 dev eth3  proto kernel  scope link  src 212.59.210.142
10.1.1.0/24 dev zlan0  proto kernel  scope link  src 10.1.1.6
169.254.0.0/16 dev eth1  scope link
=3D=3D=3D eth1 TABLA 150 =3D=3D=3D
default via 212.170.103.193 dev eth1  proto static  src 212.170.103.236
prohibit default  proto static  metric 1
=3D=3D=3D eth2 TABLA 151 =3D=3D=3D
default via 212.170.103.193 dev eth2  proto static  src 212.170.103.235
prohibit default  proto static  metric 1
=3D=3D=3D eth3 TABLA 152 =3D=3D=3D
default via 212.59.210.1 dev eth3  proto static  src 212.59.210.142
prohibit default  proto static  metric 1
=3D=3D=3D TABLA 200 (defecto) =3D=3D=3D
default  proto static
        nexthop dev eth1 weight 1
        nexthop dev eth2 weight 1
        nexthop dev eth3 weight 3


You can change it a bit to alow a default route for your 67.17.117.0/24
network and another to everything else.

Regards

El Mie, 28 de Mayo de 2008, 22:26, jeev escribi=F3:
> ok.
>
> i sort of understand..
>
> i've managed to get it working with the following:
> ip route add 69.17.117.0/24 via GATEWAY-OF-ETH2 src IP-OF-ETH2
>
> AND adding this to iptables before the default route.
>
> -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d 67.17.117.0/24 -j
> MASQUERADE
>
> i do understand the link you gave me but do not understand where i
> input details of the networks in question.
>
> i want to route everything out the default connection which would be
> eth3, EXCEPT for what i define in ip blocks like i listed above.
>
> and as far as the commands i ran up there to get them working. i have
> 2 cable modems, node is running great right now, i should be able to
> get 10mbit from each but when i run a speedtest using one ip and then
> start the other.. it slows down.. (making me believe that it's still
> riding off one ip somehow) so when i get home, i'm going to look at
> graphs i guess.
>
> also, i have a viatalk linksys adapter at home and it's set up as
> following:
>
> ip route add table 10 dev eth2
> ip rule add from 192.168.2.5/32 table 10 priority 1
> and
>     0     0 MASQUERADE  all  --  any    eth2    viatalk  anywhere
>
> and as i just restarted the adapter
>
>    10   563 MASQUERADE  all  --  any    eth2    viatalk  anywhere
>
> the adapter does pick the correct external ip now but it's still
> having trouble connecting to the login server.
>
> any help would be appreciated.
>
> i really am considering dropping back to PFSENSE on bsd.. i was also
> having some minor issues there but it was about something else
> although it was rock solid for about 2 months.
>
> thanks everybody.
>
> On Wed, May 28, 2008 at 4:50 AM, Jan Engelhardt <jengelh@medozas.de>
> wrote:
>>
>> On Wednesday 2008-05-28 07:03, Patrick McHardy wrote:
>>
>>> jeev wrote:
>>>> Hey guys, i was reading on the netfilter site.
>>>>
>>>> I saw Patrick McHardy wrote about having 2 cable modems... i'm in =
the
>>>> same situation... my only problem is that I dont want to do load
>>>> balancing, i've just come from using PFSENSE/freebsd to use
>>>> ClarkConnect on CentOS i guess.. i've never used iptables before. =
i've
>>>> tried things like:
>>>>
>>>> "iptables -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d
>>>> 67.17.117.0/24 -j MASQUERADE" and it still doesn't work.
>>>>
>>>> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.1
>>>> 24.x.x.0/23 dev eth2  proto kernel  scope link  src 24.x.x.23
>>>> 71.x.x.0/23 dev eth3  proto kernel  scope link  src 71.x.x.6
>>>> default via 71.x.x.1 dev eth3
>>>>
>>>> so right now i have all traffic go out eth3, i'd love to have the =
ips
>>>> and ipblocks i select and have it go out one of the cable interfac=
es.
>>>> so for the example above, i want www.speedtest.net (because it sho=
ws
>>>> the ip) to go out eth2 but it's still going out eth3.
>>>
>>>[...]
>>> You can use any criteria you like for distribution, the important
>>> thing is to make sure connections stay on one connection when using
>>> NAT (since many providers don't allow spoofed addresses), [...]
>>> Dealing with incoming connections on both internet connections
>>> is trickier because you need to make sure they go out the same
>>> way they came in, so I'll skip this because I'm short on time
>>> right now :)
>>
>> As described in http://dev.medozas.de/NF-Cookbook.txt.
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


