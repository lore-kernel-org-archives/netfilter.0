From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Fighting back
Date: Fri, 17 Jan 2003 20:41:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301172041.32136.Alistair@nerdnet.ca>
References: <20030117192237.66443.qmail@web40206.mail.yahoo.com> <002501c2be7f$fad767a0$6301a8c0@VAIO> <1042817187.516.3.camel@ranjeet-linux-1>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042817187.516.3.camel@ranjeet-linux-1>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>, Linux <linux@usermail.com>
Cc: netfilter@lists.netfilter.org


=09I'm inclined to agree with these folks ... I would rather think
=09that TARPIT would be more to appropos what you would like ...=20
=09further it would at least make that scan a longish one ...=20
=09although I suppose that would depend on the scanning software=20
=09being used..... as well as the true skill level of the scanner.  Keep
=09in mind that althought there are a lot of script kiddies out there,=20
=09there are still some folks with more skill than good graces or=20
=09brains, and they will manage to do something with what ever you
=09give them ... (Gotta love DROP ... )=20

=09Alistair


On January 17, 2003 10:26 am, Ranjeet Shetye wrote:
> if a spammer locates 2 people with MIRROR on, and sends spam to A while
> spoofing's B's address as source, you've got disaster on hand.
>
> if you really piss off an intelligent spammer (is there such a thing ?)=
,
> he/she might set you up by spoofing your IP to N other MIRROR sites,
> effectively forcing you to execute a DDoS on yourself.
>
> Be careful what you wish for :D
>
> Ranjeet.
>
> On Sat, 2003-01-18 at 00:27, Linux wrote:
> > That's a very good point.
> >
> > Hmmm... More thinking needed.
> >
> > Linux_303
> >
> >
> > ----- Original Message -----
> > From: "SBlaze" <dagent.geo@yahoo.com>
> > To: "Linux" <linux@usermail.com>
> > Sent: Friday, January 17, 2003 12:22 PM
> > Subject: Re: Fighting back
> >
> > > I think its safe to say we would all like to give a little back to
> > > those
> >
> > who
> >
> > > repeatedly bombard us with useless scans... What you want to do can
> > > "theoretically" be done with the MIRROR jump. Should it be done?
> > > Probably
> >
> > not.
> >
> > > Once an attacker learns they are in a sence scaning themselves.... =
they
> >
> > can
> >
> > > easily go about some sort of spoofing method in which the SRC IP is=
 a
> >
> > target as
> >
> > > opposed to himself. You could easily find yourself a man in the mid=
dle
> > > of
> >
> > a DOS
> >
> > > attack against someone.
> > >
> > > I wouldn't do this... but hey it's up to you
> > >
> > > SBlaze
> > >
> > > --- Linux <linux@usermail.com> wrote:
> > > > Hello all,
> > > >
> > > > I feel that rpc and netbois scans to my network from the outside =
are
> > > > an obvious attempt to see what I have open, and I'm sure all of y=
ou
> > > > would
> >
> > agree.
> >
> > > >  Because I run NFS only via my internal network, there are no
> > > > machines
> >
> > that
> >
> > > > would connect via my external interface.  I am going to institute=
 a
> > > > rule
> >
> > that
> >
> > > > will cause a person scanning on ports 32770:32789 and 137 to redi=
rect
> >
> > and
> >
> > > > scan the ports on the src IP address.  In essence, anyone scannin=
g
> > > > me,
> >
> > will
> >
> > > > be basically scanning themselves.
> > > >
> > > > All I am asking is for some input to this and whether it is a goo=
d
> > > > idea
> >
> > or
> >
> > > > not.
> > > >
> > > > Thank you,
> > > >
> > > > Linux_303
> > >
> > > =3D=3D=3D=3D=3D
> > > "No touchy NO TOUCHY! Emperor Kuzko -=3DEmperor's New Groove=3D-"
> > >
> > > __________________________________________________
> > > Do you Yahoo!?
> > > Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> > > http://mailplus.yahoo.com

