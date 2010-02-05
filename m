From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 05 Feb 2010 22:53:31 +0200
Message-ID: <1265403211.3910.36.camel@casper.meteor.dp.ua>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
	 <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
	 <1265394296.3910.19.camel@casper.meteor.dp.ua>
	 <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
	 <1265399439.3910.29.camel@casper.meteor.dp.ua>
	 <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
	 <81ed8b881002051204q42413b75p6e83564f055a35aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <81ed8b881002051204q42413b75p6e83564f055a35aa@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 05/02/2010 =D7 15:04 -0500, Dan Daugherty =D0=C9=DB=C5=D4=
:
> Forgot to mention I'm on a Redhat Enterprise Linux 5 box with the
> stock kernel.  Tried to compile my own and the build fails
> immediately.  I assumed that since I can route requests locally, the
> kernel was compiled properly for iptables.

To do what you are trying to do iptables are not enough.

> On Fri, Feb 5, 2010 at 3:01 PM, Dan Daugherty <rescue@ddaniscool.com>=
 wrote:
> >> Are you using /16 netmask?
> > No, I just took the 10.117 part off the ip's to shorten the message=
=2E
> >>
> >>
> >> None of them got SNATed. Why? Should they go out through eth0? Try=
 to
> >> remove "-o eth0".
> > Removed it and no change
> >>
> >> Also do you have ip.forwarding enabled (sysctl -a | grep forward")=
?
> > net.ipv6.conf.eth0.forwarding =3D 0
> > net.ipv6.conf.default.forwarding =3D 0
> > net.ipv6.conf.all.forwarding =3D 0
> > net.ipv6.conf.lo.forwarding =3D 0
> > net.ipv4.conf.eth0.mc_forwarding =3D 0
> > net.ipv4.conf.eth0.forwarding =3D 1
> > net.ipv4.conf.lo.mc_forwarding =3D 0
> > net.ipv4.conf.lo.forwarding =3D 1
> > net.ipv4.conf.default.mc_forwarding =3D 0
> > net.ipv4.conf.default.forwarding =3D 1
> > net.ipv4.conf.all.mc_forwarding =3D 0
> > net.ipv4.conf.all.forwarding =3D 1
> >
> >>
> >> Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 1=
521)?
> >>
> > Negative, but the command from sethra fails immediately with nothin=
g
> > showing in the logs
> >
> > There has also been mention of a FORWARD chain being necessary.  I
> > haven't done anything outside of the commands listed in this thread=
=2E
> >
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

