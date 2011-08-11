From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 08:03:54 -0400
Message-ID: <1313064234.3628.63.camel@denise.theartistscloset.com>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>
	 <1313057465.3408.12.camel@tiger.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313057465.3408.12.camel@tiger.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

On Thu, 2011-08-11 at 12:10 +0200, Eric Leblond wrote:
> Hello John,
> 
> Nice to hear from you again ;)
Thanks, it has been a while since I've been here. We're still plodding
along with ISCS (http://iscs.sourceforge.net).  Although we've not
updated the site in years and I'm way behind on a new release, we have
actually made considerable progress.  There still seems to be nothing
else that does what it does.  We have coined the term Firepipes to
describe it as opposed to Firewall as that better describes our model of
no inside and no outside, i.e., no one can go anywhere on the network
unless they have a firepipe and explosions in the firepipe stay in the
firepipe, i.e., no escalation of privileges.  So, hopefully at some
point, we'll pick up some corporate sponsorship as it is far too big for
our limited resources.
> 
> On Thu, 2011-08-11 at 05:46 -0400, John A. Sullivan III wrote:
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
> > 
> > Here are three specific examples.  The first is from the FORWARD chain.
> > Here are the logging messages:
> > 
> > 
> > Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=bond1 OUT=bond4
> > SRC=172.x.y.73 DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940
> > DF PROTO=TCP SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0
> 
> I've already observed this kind of problem. This was related with some
> software/OSes having really strange timeout value.
> 
> To check weither this is the same problem, you can ask the kernel to log
> the reason why the packets are invalid. This can be made by running:
> 
>         echo "255">/proc/sys/net/netfilter/nf_conntrack_log_invalid
> 
> After doing this, the kernel will log all invalid packets through the
> default log system. You can check which one you are using by doing:
>   
>         cat /proc/net/netfilter/nf_log 
>          0 NONE ()
>          1 NONE ()
>          2 ipt_LOG (ipt_LOG)
>         ...
>         
Ah - that's why we didn't see anything when we enabled it.  I'll do that
again with the proper log setting.  Thanks.
> 2 is the coding for IPv4. With that ipt_LOG value, the message are sent
> via the standard kernel log. If instead of this value, you've got
> something like ULOG or NFLOG, you will need to get the message by
> listening to the nflog-group or ulog-group 0 in ulogd[2].
> 
> If this is timeout issue, you can play with the timeout setting of the
> conntrack in the /proc/sys/net/netfilter/nf_conntrack_*time* files.
> 
> BR,
We'll see what the logging says. The strange thing about the last two
examples is that they happen midstream.  They are X2Go sessions
(www.x2go.org), an NX implementation for remote display presentation.
The users are typing away when, suddenly, their session drops and we see
these INVALID packets and associated drops so it doesn't smell like a
timing issue.  But we'll log and see what we get.  Thanks again - John

