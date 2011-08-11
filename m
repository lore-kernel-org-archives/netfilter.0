From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 08:09:50 -0400
Message-ID: <1313064590.3628.69.camel@denise.theartistscloset.com>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>
	 <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Thu, 2011-08-11 at 12:12 +0200, Jozsef Kadlecsik wrote:
> Hi,
> 
> On Thu, 11 Aug 2011, John A. Sullivan III wrote:
> 
> > Hello, all.  We have been having a subtle problem with conntrack for
> > quite a long time but it has suddenly gotten much worse.  Packets are
> > being matched as INVALID when we would expect them to be ESTABLISHED.
> > We are running on kernel 2.6.30.5 on X86_64 with CentOS 5.4 and
> > iptables-1.3.5-5.3.el5_4.1.  This has escalated from a minor annoyance
> > that we were going to investigate to provoking serious outages and all
> > hands to the pump.
> > 
> > The conntrack table is not swamped although we did increase the max
> > count and the hashsize just in case to no avail:
> > [root@fw01 netfilter]# cat ip_conntrack_max
> > 65536
> > [root@fw01 netfilter]# cat ip_conntrack_count
> > 532
> > 
> > Here are three specific examples.  The first is from the FORWARD chain.
> > Here are the logging messages:
> >  
> > Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=bond1 OUT=bond4
> > SRC=172.x.y.73 DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940
> > DF PROTO=TCP SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0
> 
> Those are, with high probabilty, late FIN packets: the belonging conntrack 
> entry has already been deleted and thus conntrack cannot find the matching 
> stream, therefore it sets as INVALID.
Thank you very much, Jozsef.  That would explain why we did not
categorize this as a high priority in the past as it seemed to have
minimal impact.  I would guess we do not need to be concerned about
these.

However, the other two are much more problematic and what escalated this
into a crisis.  As I just explained in another reply, these are
happening in the middle of activity, i.e., they are NX remote desktop
sessions being carried via SSH.  The users are in the middle of typing
or scrolling through their desktops, in other words, the connection is
definitely active and passing many packets.  Then, without warning,
their desktops freeze, the connection eventually times out, and we see
these INVALID and dropped packets.  That's the one we really need to
solve.
> 
> > So why is the reply packet INVALID instead of ESTABLISHED? How can we
> > troubleshoot?
> 
> If NAT is enabled, never ever let packets with INVALID state pass through, 
> because NAT will skip them.
I'm not entirely sure what you mean by this - sorry.  Are you saying we
should always have a rule to drop INVALID packets at the beginning of
NAT or are you saying that the reason we are seeing these in the INPUT
chain is because they were "labeled" as INVALID before hitting the nat
table and that's why NAT skipped them? If the latter, we are still back
to the original problem of why are these ESTABLISHED packets being
considered as INVALID?

Thanks very much - John
>  
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary


