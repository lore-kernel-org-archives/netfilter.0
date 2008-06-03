From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: load balance [OT?]
Date: Wed, 4 Jun 2008 00:27:10 +0200 (CEST)
Message-ID: <44140.84.123.239.190.1212532030.squirrel@www.arcoscom.com>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: mylists@itcom.com.ar

I was using the patch you commented along this thread but it overloads =
the
routing tables.

Now I have this configuration:
=3D=3D=3D REGLAS IPTABLES PARA EL ENRUTADO =3D=3D=3D
Chain PREROUTING (policy ACCEPT 21M packets, 16G bytes)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      14M   11G M_TRAF_IN  all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
2      13M   10G M_IFACE    all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
Chain M_IFACE (1 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      12M 8196M CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
2    2581K 2331M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000
3      11M 8158M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0       =
  =20
 0.0.0.0/0           MARK match 0x0/0xf000
4    40242 2284K MARK       all  --  eth2   *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
5    40342 2381K MARK       all  --  eth3   *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
6    80584 4665K CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
7      11M 8158M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
Chain M_IFACE_TRAF (2 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
Chain FORWARD (policy ACCEPT 3292K packets, 1985M bytes)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1    1618K 1046M M_IFACE_OUT  all  --  *      *       0.0.0.0/0        =
  =20
0.0.0.0/0
Chain OUTPUT (policy ACCEPT 20M packets, 15G bytes)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      13M 9867M M_IFACE_OUT  all  --  *      *       0.0.0.0/0        =
  =20
0.0.0.0/0
Chain M_IFACE_OUT (2 references)
num   pkts bytes target     prot opt in     out     source             =
=20
destination
1      13M 9885M CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
2    2342K 1180M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000
3      12M 9733M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0       =
  =20
 0.0.0.0/0           MARK match 0x0/0xf000
4    58815 3592K MARK       all  --  *      eth2    0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
5    59337 3615K MARK       all  --  *      eth3    0.0.0.0/0          =
=20
0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
6     118K 7207K CONNMARK   all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
7      12M 9733M RETURN     all  --  *      *       0.0.0.0/0          =
=20
0.0.0.0/0
=3D=3D=3D REGLAS DE ENRUTAMIENTO =3D=3D=3D
0:      from all lookup local
50:     from all lookup main
100:    from all fwmark 0x2000/0x2000 lookup uno
101:    from all fwmark 0x8000/0x8000 lookup dos
150:    from 212.170.103.235 lookup uno
151:    from 212.59.210.142 lookup dos
200:    from all lookup defecto
32766:  from all lookup main
32767:  from all lookup default
=3D=3D=3D TABLAS DE RUTAS =3D=3D=3D
=3D=3D=3D MAIN =3D=3D=3D
212.170.103.192/26 dev eth2  proto kernel  scope link  src 212.170.103.=
235
192.168.3.0/24 dev zlan0  proto kernel  scope link  src 192.168.3.247
192.168.2.0/24 dev zlan0  proto kernel  scope link  src 192.168.2.247
192.168.1.0/24 dev zlan0  proto kernel  scope link  src 192.168.1.247
212.59.210.0/24 dev eth3  proto kernel  scope link  src 212.59.210.142
10.1.1.0/24 dev zlan0  proto kernel  scope link  src 10.1.1.6
=3D=3D=3D eth2 TABLA 150 =3D=3D=3D
212.170.103.192/26 dev eth2  scope link  src 212.170.103.235
default via 212.170.103.193 dev eth2  src 212.170.103.235
prohibit default  proto static  metric 1
=3D=3D=3D eth3 TABLA 151 =3D=3D=3D
212.59.210.0/24 dev eth3  scope link  src 212.59.210.142
default via 212.59.210.1 dev eth3  src 212.59.210.142
prohibit default  proto static  metric 1
=3D=3D=3D TABLA 200 (defecto) =3D=3D=3D
default
        nexthop via 212.170.103.193  dev eth2 weight 1
        nexthop via 212.59.210.1  dev eth3 weight 1



Appears to work, but, for now, I'm having problems (last Centos 2.6.18
kernel).

I expect this can help you a bit. Be care, I have some problem as you,
with previous 2.6.18 centos kernel this configuration appeared to works
fine, but with last 2.6.28 centos kernel I'm having troubles.

Regards

El Lun, 2 de Junio de 2008, 21:26, Martin escribi=F3:
> Hello netfilter list!
>
> I don't know if this is the right place to post this question, but lo=
oks
> that I won't find people with more knowledge about networking anywher=
e
> else :)
>
> I've been browsing list archive and some people send a few examples o=
n
> how to do it with ip route, but it's not working for me...
>
> Here is what I've configured based on those examples and this
> http://lartc.org/lartc.html
>
>
> I've two ISP, and internal lan.
>
> #ISP 1
> ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP table 1
> ip route add default via $ISP1_GW dev $ISP1_IF
>
> #ISP 2
> ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP table 2
> ip route add default via $ISP2_GW dev $ISP2_IF
>
> #Rules for ISPs
> ip rule add $ISP1_IP table 1
> ip rule add $ISP2_IP table 2
>
> #Internal LAN and cross reference to the other ISP
> ip route add $LAN_NET dev $LAN_IF table 1
> ip route add $ISP2_NET dev $ISP2_IF table 1
>
> ip route add $LAN_NET dev $LAN_IF table 2
> ip route add $ISP1_NET dev $ISP1_IF table 2
>
> #Add isp net in main
> ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP
> ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP
>
> #This should do the trick of balancing
>
> ip route add default scope global equalize nexthop via $ISP1_GW dev
> ISP1_IF weight 1 nexthop via $ISP2_GW dev $ISP2_IF weight 2
>
>
> What actually happens is that traffic is going out only by the first =
GW
> declared in the first nexthop, and it doesn't care weight nor balance=
=2E
> The only chance of making it to go throw the second GW declared is
> shutting down or collapse that interface, so then it goes for the sec=
ond
> one.
>
> I'm using a vanilla kernel 2.6.23.17 with Alexey Kuznetsov's route
> patches and some others at http://www.ssi.bg/~ja/ (using the
> combinations patch offered in the site)
>
>
>
> What am I doing wrong? I'm missing something, but can't figure out
> what...
>
>
> Any clue will be investigated ;)
>
>
> Thanks for your time
>
>
> Martin
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


