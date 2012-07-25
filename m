From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: per host accounting
Date: Wed, 25 Jul 2012 12:19:51 +0200
Message-ID: <20120725101951.GA22430@1984>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
 <1343030447.12730.5.camel@tiger.regit.org>
 <CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yucong Sun =?utf-8?B?KOWPtumbqOmjnik=?= <sunyucong@gmail.com>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Mon, Jul 23, 2012 at 03:27:08PM -0700, Yucong Sun (=E5=8F=B6=E9=9B=A8=
=E9=A3=9E) wrote:
> Thanks for the reply, Yeah I'm aware all of that you have mentioned,
> please allow me to elaborate my requirements a little more.
>=20
> I have about 500 IPs behind a router, and I want have something on my
> router to monitor the ingress bps/pps to each specific IP. And I woul=
d
> like to have a cron job  that scans the result and find the top 5  IP
> with most bps/pps and also do some action against it, calling a
> script, sending a email etc.
>=20
> So, It seems none of the existing stuff allows me to do this.

You can add one nfacct rule per IP and then use the nfacct utility to
periodically dump the counters and find for top IPs. Some shell script
should allow want you need. You can also develop your own daemon with
native libnetfilter_acct interfaces to periodically pull the counters
and perform the processing you need.

> the easiest brain-dead solution I can think of is to just create a ch=
ain
> with 500 rules in it, and have a cron job to cacluate the bytes
> difference every time it executes.

Instead of this, I'd go nfacct.

> Obviously, this  will introduce a
> lot of delays, I'm hoping to have something that basically don't
> affect performance too much and or something to just generates a tabl=
e
> of ip  / accumulative packets / accumulative bytes, and I will be abl=
e
> to work with that.

Well, how much is "a lot of delay". I think your performance concerns
need real numbers. I don't think that will be too much as you mention.
