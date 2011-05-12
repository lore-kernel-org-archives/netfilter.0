From: nowhere <nowhere@hakkenden.ath.cx>
Subject: Re: NFQUEUE looses packets between arrival and verdict
Date: Thu, 12 May 2011 13:40:07 +0400
Message-ID: <1305193207.9902.8.camel@compot-mob>
References: <1304489658.32272.19.camel@compot-mob>
	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>
	 <4DC26A0A.8050402@tana.it> <1304587479.6402.3.camel@compot-mob>
	 <4DCAC715.3090206@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DCAC715.3090206@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A1=D1=80=D0=B4, 11/05/2011 =D0=B2 19:27 +0200, Alessandro Ve=
sely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Finally I've found some time to try that.  Sorry for the delay.
>=20
> On 05/May/11 11:24, nowhere wrote:
> >>> Indeed. The first packet is never dropped, then comes a serie of =
drops
> >>> (the number of dropped packets depends on the sending rate, i.e. =
testing
> >>> with iperf on, say, 50 Mbit/s shows drops of ~800 packets) and af=
ter
> >>> that no drops at all. Distribution and it's parameters do not mat=
ter
> >>> except for zeroes: if there is no artificial delay, no packets ar=
e
> >>> dropped.
>=20
> It seems enough to avoid delaying the call to nfq_set_verdict for the
> first packet of a burst.  For a shot in the dark, packets seem to get
> lost if they arrive between the first one and the corresponding call
> to nfq_set_verdict.  Indeed, setting a fixed real_delay of 0.2, with
> ping -i 0.2 it looses no packets, with ping -i 0.19 it looses just th=
e
> second one, with ping -i 0.09 icmp_reqs #2 and #3.
>=20
> No error is returned, whether NETLINK_NO_ENOBUFS is set or not.

Well, seems like this is the case. If nfqueue becomes empty, first
enqueued packet must not be delayed. Adding queue length check and skip
delaying first packet eliminates drops.
But... delay may be due to packet processing, and hence unavoidable. I
mean, this "workaround" is not a workaround...

> >> Did you check return codes from nfq_set_verdict()?  If that is 0, =
it must be
> >> a bug.                       I meant >=3D 0 here ----------------^
> >=20
> > nfq_set_verdict() returns 32
>=20
> AFAIK the library does not queue data, so I'd guess the bug is in the
> kernel.  I hope someone else chimes in and explains some more of this=
=2E
> (I change the subject trying to draw attention.)
>=20
> > I'm using Gentoo x86_64 v2.6.38-gentoo-r4 (2.6.38.5 + minor patches=
).
> > libnetfilter_queue is 0.0.17
>=20
> Same on Debian x86_64 2.6.32-something, and libnetfilter_queue 0.0.17


