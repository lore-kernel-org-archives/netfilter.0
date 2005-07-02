From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 16:53:36 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAAECNBDAB.dleangen@canada.com>
References: <ab5428f705070200353c461ac@mail.gmail.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ab5428f705070200353c461ac@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Thanks again for the follow up...

> and may be its due some core level probs not due to any
> misconfiguration or sort of things like that. may be the problem
> lies in the package.

Sounds like this may be a good guess. I installed a second FC3 system, and
I'm not having that problem at all. Everything is working just fine on the
second system, including the default iptables installation. I really can't
figure out why it works on one machine, but not the other...

I'll try a fresh install and see what happens.


Thanks again for the advice.


Cheers,
Dave



> -----Original Message-----
> From: tahmeed [mailto:qs.tahmeed@gmail.com]
> Sent: 2 July 2005 16:35
> To: dleangen@canada.com
> Cc: netfilter@lists.netfilter.org
> Subject: Re: /etc/sysconfig/iptables does not load on reboot
>
>
> hello,
>
> this is what u should see if iptables starts up successfully during
> reboot - at least
>
> Jul  2 13:00:45 gizmo rc: Starting iptables:  succeeded
>
> and may be its due some core level probs not due to any
> misconfiguration or sort of things like that. may be the problem lies
> in the package.
>
> if its possible pls download a fresh package of iptables from
>
> www.netfilter.org
>
> regards........
>
>
> On 7/2/05, David Leangen <dleangen@canada.com> wrote:
> >
> > > Well, in that case, I have no idea. Did you check the startup logs?
> > > Does the system display [ OK ] on the iptables line when booting?
> >
> > Yep, the system displays [ OK ] and I don't see anything of
> interest in the
> > logs. That's exactly why I can't figure this out. If at least there were
> > some info in the logs, that would at least point me in some direction.
> > Unless, of course, I'm looking in the wrong place...
> >
> >
> > Cheers,
> > Dave
> >
> >
> >
> >
> > > -----Original Message-----
> > > From: Alexey Toptygin [mailto:alexeyt@freeshell.org]
> > > Sent: 2 July 2005 15:39
> > > To: David Leangen
> > > Subject: RE: /etc/sysconfig/iptables does not load on reboot
> > >
> > >
> > > On Sat, 2 Jul 2005, David Leangen wrote:
> > >
> > > > [root@sannomiya ~]# chkconfig --list iptables
> > > > iptables        0:off   1:off   2:on    3:on    4:on
> 5:on    6:off
> > > >
> > > > My /etc/rc.d/init.d/iptables script is the default script installed
> > with
> > > > FC3.
> > >
> > > Well, in that case, I have no idea. Did you check the startup
> logs? Does
> > > the system display [ OK ] on the iptables line when booting?
> > >
> > >  			Alexey
> >
> >
> >
>
>
> --
> Happy! If not now never


