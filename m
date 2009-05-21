From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 14:50:43 +0300
Message-ID: <1242906643.4763.9.camel@casper.meteor.dp.ua>
References: <4A142FF7.1050700@duet.it>
	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
	 <4A150D46.6090806@duet.it> <1242896445.4763.1.camel@casper.meteor.dp.ua>
	 <4A15376F.4080401@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A15376F.4080401@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 21/05/2009 =D7 13:13 +0200, Fabio Marcone =D0=C9=DB=C5=D4=
:
> Hi!
>=20
> >> With your script I get the same result as mine: 2 parallel connect=
ions=20
> >> (with different priority), one uses all bandwitdh and the other st=
alls=20
> >> alternatively.
> >>
> >> perhaps there is a timeout mechanims that forse sending queued pac=
kets=20
> >> although lower priority?
> >>    =20
> >
> > This is exactly how PRIO works. Higher priority classes get dequeue=
d
> > first, so if there is something to dequeue forever then the lower
> > priority classes would never dequeue.
> >
> >  =20
> but it's not behaviour shown by test. And I don't no why.=20
> Ex.
> connection A -> higher priority
> connection B -> lower priority
>=20
> results:
> time      | connection A | connection B
> 1 sec           32 KB/s             0 KB/s
> 10 sec         18 KB/s           15 KB/s
> 20 sec           2 KB/s           31 KB/s
> 30 sec           0 KB/s           32 KB/s
> 40 sec         15 KB/s           16 KB/s
> 50 sec         25 KB/s             7 KB/s
> 60 sec         33 KB/s             0 KB/s
>     ...                 ....                    ....
> and so on
>=20
> do you understand? I don't know why...
>=20
> suggestions are welcome.

If you mean why connB get traffic - then it's probably connA doesn't
*always* fill its bandwide which makes it possible for connB to send.

Try to fullfil connA with several mass downloading connections.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

