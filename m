From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MASQUERADE
Date: Fri, 9 Jul 2004 11:51:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407091151.01620.Antony@Soft-Solutions.co.uk>
References: <f51b72bc040708204912ab0cc7@mail.gmail.com> <20040709103513.GA18894@itstud.chalmers.se>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040709103513.GA18894@itstud.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

On Friday 09 July 2004 11:35 am, Erik Wikstr=F6m wrote:

> On Fri, Jul 09, 2004 at 09:19:58AM +0530, Payal Rathod wrote:
> > Hi,
> > Is there any different way to do MASQUERADE in kernel 2.6.3-7  with
> > iptables v1.2.9?
> > I get,
> >
> > # iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> > iptables: Invalid argument
> >
> > A quick look at the man page did not suggest anything.
> > Any ideas to what is missing?
>
> First of all I'd like to say that I'm in no way an expert but are you
> sure that you have the right stuff compiled in kernel or as modules? In
> 2.6.7 I had to select to compile MASQUERADE in the kernel, same thing
> with the mangle table if I remember correctly.

I see no reason not to compile everything you need for netfilter into the=
=20
kernel (instead of building as modules).   That way you know all the supp=
ort=20
is there from bootup, nothing can be removed through forgetfulness or mal=
ice,=20
and you don't have to worry about whether A depends on B, depends on C, e=
tc..

Sure, if you want to use a new feature you didn't previously build, you n=
eed=20
to recompile the kernel and do a reboot, but in most cases that should be=
 (a)=20
infrequent, and (b) pretty simple.

Regards,

Antony.

--=20
In Heaven, the police are British, the chefs are Italian, the beer is Bel=
gian,=20
the mechanics are German, the lovers are French, the entertainment is=20
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is Americ=
an,=20
the mechanics are French, the lovers are Swiss, the entertainment is Belg=
ian,=20
and everything is organised by the Italians.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


