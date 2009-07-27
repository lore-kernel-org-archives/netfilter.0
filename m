From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: IMQ and marking
Date: Mon, 27 Jul 2009 11:23:36 +0300
Message-ID: <1248683016.4090.14.camel@casper.meteor.dp.ua>
References: <4A65A1A4.4020805@duet.it>  <4A65CEE6.9050004@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65CEE6.9050004@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 21/07/2009 =D7 16:21 +0200, Fabio Marcone =D0=C9=DB=C5=D4=
:
> In a post in a forum I see this:
> iptables -t mangle -A PREROUTING -m owner --pid-owner <PID of process=
> -=20
> -j MARK --set-mark 2


> iptables -t mangle -A PREROUTING -j IMQ --todev 0

This rule just tells the kernel to put this packet to imq0 device just
after the mangle table is processed, not immediatelly. So it is safe an=
d
good practice to place those rules closer to the top.

> the second rule is used? so, rule matching in mangle table is not blo=
cking?
>=20
> Fabio
> > Hi!
> > I'm studying how to introduce traffic shaping in a linux router=20
> > (debian). I mark packets in prerouting using mac source to forward=20
> > packets on a selected WAN interface.
> > I need to use mangle in PREROUTING to send packects (in input) to a=
=20
> > imqX interface.
> > Is there a conflict between mark and IMQ?
> > If so, how it can be solved?
> >
> > Thanks in advance,
> > Fabio Marcone
> > --=20
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

