From: George Klein <george.klein@t-t-l.co.uk>
Subject: Re: Disappearing packets
Date: Mon, 24 Mar 2008 23:25:51 +0000
Message-ID: <1206401151.15713.20.camel@len.t-t-l.co.uk>
References: <1206222481.14091.19.camel@len.t-t-l.co.uk>
	 <47E58F01.10800@erentil.net> <1206226655.14091.24.camel@len.t-t-l.co.uk>
	 <47E78E10.80102@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E78E10.80102@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


On Mon, 2008-03-24 at 12:18 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> george a =C3=A9crit :
> > On Sat, 2008-03-22 at 15:58 -0700, Jon Wilson wrote:
> >=20
> >>/proc/sys/net/ipv4/ip_forward is set to 1?
> > Thanks Jon,
> >=20
> > I hadn't checked that because I /knew/ that it was set already.  Ho=
w
> > embarrassing...
>=20
> I wonder how outgoing packets went through without ip_forward set. Di=
d=20
> you play with /proc/sys/net/ipv4/conf/*/forwarding ?

Good question.  I'm pretty sure I hadn't played with any individually
and I've found that I (or possibly an update but most likely me)
commented the relevant line in sysctl.conf that should have enabled
forwarding.  I've also looked back through my logs and seen the outgoin=
g
packets being forwarded before I re-enabled forwarding.

Do you think this might be a real problem that's worth me trying to
reproduce when I have time, or just sloppy configuration and confusion?

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

