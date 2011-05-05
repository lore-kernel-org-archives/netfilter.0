From: nowhere <nowhere@hakkenden.ath.cx>
Subject: Re: libnetfilter_queue question
Date: Thu, 05 May 2011 13:24:39 +0400
Message-ID: <1304587479.6402.3.camel@compot-mob>
References: <1304489658.32272.19.camel@compot-mob>
	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>
	 <4DC26A0A.8050402@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DC26A0A.8050402@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A7=D1=82=D0=B2, 05/05/2011 =D0=B2 11:12 +0200, Alessandro Ve=
sely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 04.05.2011 20:32, Nikolay S. wrote:
> > =D0=92 =D0=A1=D1=80=D0=B4, 04/05/2011 =D0=B2 20:13 +0200, Alessandr=
o Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On 04.05.2011 08:14, nowhere wrote:
> >>> Several packets at the beginning get lost.
> >>
> >> Are they always at the beginning, or does that depend on the distr=
ibution of
> >> delays?
> >=20
> > Indeed. The first packet is never dropped, then comes a serie of dr=
ops
> > (the number of dropped packets depends on the sending rate, i.e. te=
sting
> > with iperf on, say, 50 Mbit/s shows drops of ~800 packets) and afte=
r
> > that no drops at all. Distribution and it's parameters do not matte=
r
> > except for zeroes: if there is no artificial delay, no packets are
> > dropped.
>=20
> Looks like pretty reproducible.  I'll have a try with your code when =
I get
> back to my place.
>=20
> >> I see nothing wrong in it.  However, I'd print out occurrences of =
rv < 0
> >> after recv() and look for errno=3D=3DENOBUFS in particular.  It sh=
ould report
> >> lost packets
> >=20
> > Yes, I did it (actually this was one of the first checks). There ar=
e no
> > situations when rv < 0.
>=20
> Did you check return codes from nfq_set_verdict()?  If that is 0, it =
must be
> a bug.  What versions of library and kernel are you using?

nfq_set_verdict() returns 32

I'm using Gentoo x86_64 v2.6.38-gentoo-r4 (2.6.38.5 + minor patches).
libnetfilter_queue is 0.0.17

>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


