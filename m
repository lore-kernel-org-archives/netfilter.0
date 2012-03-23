From: "Huebner, Thomas" <thomas.huebner@cassidian.com>
Subject: RE: Bridge IPv6 traffic between 2 interfaces
Date: Fri, 23 Mar 2012 07:58:00 +0100
Message-ID: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4873@GSX300A.mxchg.m.corp>
References: <BC7EA6E099A4EE4CBC467EBF08ECB8420A4A4636@GSX300A.mxchg.m.corp><CACuyg24rGyYX9bWO21Fbo2HMHtBwwLJQEehq1j1AoNKoew5_3A@mail.gmail.com> <CACuyg24PnPZVrffq+VSvT=oA0RM-TjMD3MUV2Zj5zAw9GtVnmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <CACuyg24PnPZVrffq+VSvT=oA0RM-TjMD3MUV2Zj5zAw9GtVnmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

thanks for you'r quick response. I needed some time to fix and extend t=
he kernel with ebt_broute. I'm using openembedded and all that bitbake =
stuff needs time...
=46inaly i've integrated ebtables and the necessary kernel modules.

I assume that the preceding setup looks some thing like this (?):

# brctl addbr br0
# brctl addif br0 usb0
# brctl addif br0 usb1
# ifconfig br0 0.0.0.0 up=20

followed by:
# ebtables -t broute -A BROUTING -p ipv4 -j DROP

After that a can no longer ping (ipv4) the box from outside.


Am I missing something, May be some sysctl's?

Regards,

Thomas


> -----Original Message-----
> From: Humberto Juc=E1 [mailto:betolj@gmail.com]=20
> Sent: Thursday, March 22, 2012 12:08 PM
> To: Huebner, Thomas
> Cc: netfilter@vger.kernel.org
> Subject: Re: Bridge IPv6 traffic between 2 interfaces
>=20
> Hi,
>=20
> I do not know if I understand correctly.
>=20
> You want the IPv6 traffic across the bridge transparently.
> But whether a control standard for IPv4 - is it?
>=20
> To control what crosses the bridge or not you should use=20
> ebtables (in broute chain).
> I believe it is something like:
>=20
> ebtables -t broute -A BROUTING -p ipv4 -j DROP
>=20
> This prevents the processing of the * bridge * for IPv4=20
> packets, but you can still use iptables to filter * routing *.
>=20
> I hope it's this and that works.
> Thanks.
>=20
> Em 22 de mar=E7o de 2012 07:06, Humberto Juc=E1=20
> <betolj@gmail.com> escreveu:
> > Hi,
> >
> > I do not know if I understand correctly.
> >
> > You want the IPv6 traffic across the bridge transparently.
> > But whether a control standard for IPv4 - is it?
> >
> > To control what crosses the bridge or not you should use=20
> ebtables (in=20
> > broute chain).
> > I believe it is something like:
> >
> > ebtables -t broute -A BROUTING -p ipv4 -j DROP
> >
> > This prevents the processing of the * bridge * for IPv4=20
> packets, but=20
> > you can still use iptables to filter * routing *.
> >
> > I hope it's this and that works.
> > Thanks.
> >
> >
> > 2012/3/22 Huebner, Thomas <thomas.huebner@cassidian.com>:
> >> Hello,
> >>
> >> I have a computer (A) which is connected on the left side to a=20
> >> private network (usb0) and on the right side to a stand=20
> alone computer (B).
> >>
> >>
> >> ----+ =A0 =A0 =A0 =A0 +-----------------+ =A0 =A0 =A0 =A0 =A0 =A0+=
-------+
> >> NET | =A0 =A0 =A0 =A0 | =A0 =A0 =A0BOX A =A0 =A0 =A0| =A0 =A0 =A0 =
=A0 =A0 =A0| BOX B |
> >> =A0A =A0+--IPv4---+--- =A0IPv4 in =A0---+------IPv4--+ =A0 =A0 =A0=
 |
> >> =A0 =A0+--IPv6-+ | =A0IPv6 'arround' | +----IPv6--+ =A0 =A0 =A0 |
> >> =A0 =A0| =A0 =A0 =A0 | +-----------------+ | =A0 =A0 =A0 =A0 =A0+-=
------+
> >> ----+ =A0 =A0 =A0 +->----<--->----<--->-+
> >>
> >>
> >> I try to find a way to bridge the IPv6 traffic completely=20
> transparent=20
> >> (including all the ICMPv6 and solicitation stuff), between the=20
> >> interfaces usb0 and usb1 while the IPv4 traffic is not affected.
> >>
> >> I've tried using a brctl which connects the two interfaces=20
> perfectly,=20
> >> but disconnects them from the host A itself.
> >> Also marking the IPv6 packets with set-mark and routing them using=
=20
> >> "ip route" seems not to work.
> >>
> >> The iptables ROUTE target using the "--oif" option seems=20
> exactly what=20
> >> I'm looking for, but unfortunatly this target is not available for=
=20
> >> ip6tables.
> >>
> >> Has anyone an idea or hint?
> >>
> >>
> >> Thanks
> >>
> >> Thomas
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe=20
> netfilter"=20
> >> in the body of a message to majordomo@vger.kernel.org More=20
> majordomo=20
> >> info at =A0http://vger.kernel.org/majordomo-info.html
>=20
