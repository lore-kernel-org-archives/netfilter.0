From: "Stuart Clouston" <uncystu@hotmail.com>
Subject: Re: Kernel 2.6.18 and quota match
Date: Sat, 23 Sep 2006 00:25:32 +1000
Message-ID: <BAY108-F11F1C98A999C5BD38D2856BC210@phx.gbl>
References: <Pine.LNX.4.61.0609220757510.28671@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609220757510.28671@yvahk01.tjqt.qr>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

Hi Jan,


>From: Jan Engelhardt <jengelh@linux01.gwdg.de>
>To: Stuart Clouston <uncystu@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Kernel 2.6.18 and quota match Date: Fri, 22 Sep 2006 08:00:31 
>+0200 (MEST)
>
> >
> > With just the quota match option enabled in the kernel config, trying to 
>use
> > the quota match reported an error that it couldn't locate the 
>libipt_quota.so
> > file. Is it still necessary to use patch-o-matic-ng to obtain the quota 
>match
> > now that kernel 2.6.18 has it as an option?
>
>Kernel: 'quota' has been obsoleted by 'statistic'.
>Userspace: You are out of luck. quota was removed from POM, but its
>replacement has not appeared in iptables to date.
>
>Try POMNG revision 6660 in which most matches should still be present,
>

I have been getting my pomng files from the snapshot directory of 
Netfilter's ftp site where they are sorted by date.  I looked in 20060606 
version and could not see a statistic match.  I also can't find any 
documentation on how to use it or compile it.  When you say POMNG revision 
6660, I'm not sure which one you mean.

Also, I'm slightly confused as to why the quota match has been added to the 
latest kernel when it has been obsoleted.

Are you able to provide a link where I can find out more about the 
statistics match?  I haven't been able to find anything on netfilter's site 
or google.

> > I have applied the quota patch from the pom-ng-20060511 snapshot anyway 
>and I
> > now get the following error whenever I attempt to create a rule using 
>the quota
> > match:
> > On screen: "invalid argument"
> > syslog:  ip_tables: quota match: invalid size 0 != 24
>
>The .userspacesize in kernel/net/ipv4/netfilter_ipv4/ipt_quota.c does
>not match the .size in iptables/extensions/libipt_quota.c.
>
I'll try and use this info to fix my problem in the mean time but if the 
quota match has been superseded, I would rather use its successor.  The 
statistics match sounds as though it would offer more functionality anyway.

> > iptables 1.3.5 source is from ftp://ftp.netfilter.org/pub/iptables.  (Is 
>this
> > the correct version of iptables to use or should I be using the latest 
>version
> > from the snapshot directory on the ftp server?)
>
>
>Jan Engelhardt
>--

Thanks,
Stu

_________________________________________________________________
Thousands of jobs, millions of opportunities. Begin here! 
http://a.ninemsn.com.au/b.aspx?URL=http%3A%2F%2Fninemsn%2Eseek%2Ecom%2Eau&_t=757263760&_r=Hotmail_End_Text_Jul06&_m=EXT


