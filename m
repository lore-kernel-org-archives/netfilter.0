From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Netfilter applied to specific interfaces only
Date: Fri, 15 Mar 2013 20:25:50 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1303152024200.1009@blackhole.kfki.hu>
References: <201303102246.48024.neal.p.murphy@alum.wpi.edu> <CADju=b5nayBex9bE8CkYAFWq++r7BrrxdTSC8Ry2_wZnCwu0cQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADju=b5nayBex9bE8CkYAFWq++r7BrrxdTSC8Ry2_wZnCwu0cQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Mellander <jmellander@lbl.gov>
Cc: neal.p.murphy@alum.wpi.edu, netfilter@vger.kernel.org

On Fri, 15 Mar 2013, Jim Mellander wrote:

> On Sun, Mar 10, 2013 at 7:46 PM, Neal Murphy <neal.p.murphy@alum.wpi.edu> wrote:
> > On Sunday, March 10, 2013 10:34:36 AM Humberto Juc? wrote:
> >>
> >> This is an much discussed issue in firewall forums.
> >> I need to study a little more about it, but my current opinion:
> >>
> >> 1. The servers should not do "any filtering" - except in specific
> >> cases. They should be placed in a DMZ segment or serverfarm. However,
> >> the access to these segments is controlled by a firewall (clustered or
> >> not). So, you can focus on optimizing firewalls.
> >
> > I humbly disagree. Any server exposed to the internet should be configured to
> > limit inbound and outbound access to exactly that which is needed for it to
> > operate. For example, an simple web server should allow only new incoming
> > conns to ports HTTP and HTTPS from internet; they should block new outgoing
> > conns (since a simple web server only serves data over existing conns).
> > Management ports, like ssh, should be limited to the least reasonable set of
> > addresses expected. Periodic audits should show if these limits have been
> > altered. The server is its own first line of defense. The nearest firewall is
> > the second line of defense. The perimeter firewall is the last line of
> > defense.
> >
> > Of course, when talking about multi-Gbps links, one needs to install hardware
> > that can handle filtering that much data. If the OP has all his inter-LAN
> > traffic passing through a firewall, I might suggest his firewall is under-
> > powered, or might suggest his network topology should be reviewed. If no
> > topology changes are possible, then the only recourse is to install a firewall
> > that *can* handle filtering that much data.
> > --
> 
> Thanks for all the insightful comments - we will check out xt2.  In
> the meantime, we employ tcpwrappers, application access control, etc.
> (as well as an advanced IDS: Bro).
> 
> A firewall is not appropriate for our environment, at least for the
> big iron systems which service a worldwide diverse community, for a
> number of reasons:
> 
> 1. A 100Gps pipe restricts/eliminates firewall choices
> 2. User community, running a wide range of standard codes, and
> homegrown protocols create an impossible task of firewall maintenance
> anyway, except for standard ports <1024 & well known high ports that
> are used.

ipset may be what can help in these cases.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
