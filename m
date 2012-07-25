From: Bob Miller <bob@computerisms.ca>
Subject: Re: per host accounting
Date: Wed, 25 Jul 2012 15:10:05 -0700
Message-ID: <1343254205.2094.75.camel@worklian>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
	 <1343030447.12730.5.camel@tiger.regit.org>
	 <CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yucong Sun =?UTF-8?Q?=28=E5=8F=B6=E9=9B=A8=E9=A3=9E=29?= <sunyucong@gmail.com>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Mon, 2012-07-23 at 15:27 -0700, Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=
=9E) wrote:
> Thanks for the reply, Yeah I'm aware all of that you have mentioned,
> please allow me to elaborate my requirements a little more.
>=20
> I have about 500 IPs behind a router, and I want have something on my
> router to monitor the ingress bps/pps to each specific IP. And I woul=
d
> like to have a cron job  that scans the result and find the top 5  IP
> with most bps/pps and also do some action against it, calling a
> script, sending a email etc.

Have you checked out the ACCOUNT target out of the xtables-addons?  You
still need to create cron jobs and a script, but it should be able to d=
o
what you are looking for without too much load...




>=20
> So, It seems none of the existing stuff allows me to do this,  the
> easiest brain-dead solution I can think of is to just create a chain
> with 500 rules in it, and have a cron job to cacluate the bytes
> difference every time it executes. Obviously, this  will introduce a
> lot of delays, I'm hoping to have something that basically don't
> affect performance too much and or something to just generates a tabl=
e
> of ip  / accumulative packets / accumulative bytes, and I will be abl=
e
> to work with that.
>=20
> On Mon, Jul 23, 2012 at 1:00 AM, Eric Leblond <eric@regit.org> wrote:
> >
> > Hello,
> >
> > Le dimanche 22 juillet 2012 =C3=A0 20:22 -0700, Yucong Sun (=E5=8F=B6=
=E9=9B=A8=E9=A3=9E) a =C3=A9crit :
> > > Hi,
> > >
> > > I need a way to account traffic (bytes) for ~500 ips (fixed),  an=
d it
> > > seems creating a plain 500 rules will affect the performance a lo=
t.
> > > Without implement layered rule (like a binary search?) , is there
> > > something existing to do automatic hashing?
> > > Things like hashlimit is great, but I don't need limit matching
> > > function, just a way to create a hashtable and count bytes and
> > > packets.
> > >
> > > If there's none, I suppose it would easy enough to fork some hash=
limit
> > > code to do this.
> >
> > You can have a look at how ulogd2 and nfacct can be used for accoun=
ting:
> > https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-u=
logd2/
> >
> > BR,
> > --
> > Eric Leblond
> > Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Bob Miller
867-334-7117 / 867-633-3760
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

