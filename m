From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 12:00:45 +0300
Message-ID: <1242896445.4763.1.camel@casper.meteor.dp.ua>
References: <4A142FF7.1050700@duet.it>
	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
	 <4A150D46.6090806@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A150D46.6090806@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: Anatoly Muliarski <x86ever@gmail.com>, netfilter@vger.kernel.org

=F7 =FE=D4=D7, 21/05/2009 =D7 10:13 +0200, Fabio Marcone =D0=C9=DB=C5=D4=
:
> Thanks for your reply.
> I have just testing your script and I have some questions...
>=20
> Anatoly Muliarski wrote:
> > Hi Fabio,
> >
> > You should do something like this:
> >
> > tc qdisc add dev eth0 root handle 1: prio bands 3
> > tc qdisc add dev eth0 parent 1:1 handle 2 sfq perturb 10
> > tc qdisc add dev eth0 parent 1:2 handle 3 sfq perturb 10
> > tc qdisc add dev eth0 parent 1:3 handle 4 sfq perturb 10
> > tc filter add dev eth0 protocol ip parent 1: prio 1 <your
> > criteria_high> flowid 1:1
> > tc filter add dev eth0 protocol ip parent 1: prio 2 <your
> > criteria_middle> flowid 1:2
> > tc filter add dev eth0 protocol ip parent 1: prio 3 <your
> > criteria_low> flowid 1:3
> >  =20
> why do you set a priority on filters? In my tests I always have been=20
> used packet marking instead of "u32 match" method without prio=20
> parameter. It is the same with priority?
>=20
> > That works in my system.
> >  =20
> With your script I get the same result as mine: 2 parallel connection=
s=20
> (with different priority), one uses all bandwitdh and the other stall=
s=20
> alternatively.
>=20
> perhaps there is a timeout mechanims that forse sending queued packet=
s=20
> although lower priority?

This is exactly how PRIO works. Higher priority classes get dequeued
first, so if there is something to dequeue forever then the lower
priority classes would never dequeue.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

