From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 13:31:31 +0100
Message-ID: <1257337891.1254.220.camel@francois.tc.commsmundi.com>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
	 <4AF163EE.7060306@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF163EE.7060306@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Tell me if this one helps:
http://imagebin.org/70463

Regards,
=46ran=C3=A7ois.


On Wed, 2009-11-04 at 12:22 +0100, Patrick McHardy wrote:
> Fran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD w=
rote:
> > Hello,
> >=20
> > I got a kernel panic trying the following command on two different
> > computers with vanila kernel 2.6.30.9, and as soon as some traffic =
is
> > sent. Curriously I could not reproduce in QEMU.
> >=20
> > There is no user space program handling the QUEUE (I did not have t=
he
> > chance to get to that part).
> >=20
> > # iptables -I OUTPUT -j QUEUE
> >=20
> > Sorry I could only get a picture of the screen:
> > http://imagebin.org/70454
>=20
> I can't reproduce this here. Unfortunately your screenshot only
> includes the end of the backtrace, so its hard to tell what
> exactly happened. It crashes in packet_rcv(), so it doesn't
> look related to NFQUEUE. If you can reproduce this, please try
> to capture a full backtrace.

