From: KNO <linsms@gmail.com>
Subject: Re: diferent ports, diferent routes
Date: Tue, 5 Sep 2006 10:36:56 +0200
Message-ID: <194721190609050136j66f691c2l9e89ba26601367ad@mail.gmail.com>
References: <194721190608300726y132d8718p4fab8c32f1c4efbe@mail.gmail.com>
	<44F5A8D1.1000400@plouf.fr.eu.org>
	<194721190608310117u29fdd089r976caddc2a99fbcc@mail.gmail.com>
	<44F6B2EF.6040601@plouf.fr.eu.org>
	<194721190609010211u72f7ef69qb53223debbdebc96@mail.gmail.com>
	<44FAD898.1000709@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FAD898.1000709@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

2006/9/3, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> [Once again, please reply on the mailing list !]
Sorry ;)
>
> KNO a =E9crit :
> >>
> >> You say the packets go out, but how far ? Do they reach the router2 as
> >> expected, meaning that the destination MAC address is router2's MAC
> >> address ? Do they reach the target host ? Does the target host send a
> >> reply packet ?
> >
> > How can I know if they reach the router2?
>
> Maybe you can run a packet sniffer on the router. Else, check with a
> packet sniffer on the Linux box that the packets have the destination
> MAC addresse of the router, then check that the Linux box can reach the
> router, with ping for example.
>
It's a zyxel 600series router, and I dont know if it can do that.

> > They dont reach to target host.
>
> How did you see that ? By running a packet sniffer on the target host ?
>
Yes
> >> Does your Linux box perform SNAT or MASQUERADE on the WAN interface ?
> >>
> > No. Workstations don't have direct access to Internet, only througth
> > squid, so I dont need to do masquerade, do I?
>
> Sure.
>
> >> By the way, how do things work when you set the box default route via
> >> router2 ?
>
> That was in important question, you didn't answer it.
>
Yes I was the very most important: with router2 as default route, I
can do a ping, but I can't access the web :S
> >> Also, there is something unclear in your addressing scheme. You wrote =
:
> >>
> >> > router1 address 192.168.2.9
> >> > router2 address 192.168.2.10
> >> > linux address 192.168.2.22
> >> > linux default gateway 192.168.2.10
> >> > lan workstations use linux as proxy (squid at port 8080) 192.168.2.2=
2
> >>
> >> It seems that both your LAN and WAN networks use the same subnet
> >> 192.168.2.0/24. And :
> >>
> >> > :~# ip route ls
> >> > 192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.252
> >> > default via 192.168.2.9 dev eth0
> >>
> >> I understand these are the routes on the WAN interface. Where are the
> >> interface and route to the LAN ?
> >>
> > You are rigth: Router have only one interface conected to LAN, and
> > routers (1 and 2) are conected to LAN too.
>
> So your diagram, showing the Linux box between the LAN and the routers,
> was wrong.
> One last unclear detail : you said that the default gateway was
> 192.168.2.10 (router2) but the default route in the main routing table
> is 192.168.2.9 (router1).
You are rigth, I got this result probing. The correct data are:
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.22
default via 192.168.2.10 dev eth0



--=20
             a8888b.
             d888888b.
             8P"YP"Y88
             8|o||o|88
             8'    .88
             8`._.' Y8.
            d/      `8b.
           dP   .    Y8b.
          d8:'  "  `::88b
         d8"         'Y88b
        :8P    '      :888
         8a.   :     _a88P
       ._/"Yaa_:   .| 88P|
       \    YP"    `| 8P  `.
       /     \.___.d|    .'
       `--..__)8888P`._.'

