From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Kernel 2.6.18 and quota match
Date: Fri, 22 Sep 2006 08:00:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609220757510.28671@yvahk01.tjqt.qr>
References: <BAY108-F3CD4343FDF322275C0034BC210@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F3CD4343FDF322275C0034BC210@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Clouston <uncystu@hotmail.com>
Cc: netfilter@lists.netfilter.org

>
> With just the quota match option enabled in the kernel config, trying to use
> the quota match reported an error that it couldn't locate the libipt_quota.so
> file. Is it still necessary to use patch-o-matic-ng to obtain the quota match
> now that kernel 2.6.18 has it as an option?

Kernel: 'quota' has been obsoleted by 'statistic'.
Userspace: You are out of luck. quota was removed from POM, but its 
replacement has not appeared in iptables to date.

Try POMNG revision 6660 in which most matches should still be present,

> I have applied the quota patch from the pom-ng-20060511 snapshot anyway and I
> now get the following error whenever I attempt to create a rule using the quota
> match:
> On screen: "invalid argument"
> syslog:  ip_tables: quota match: invalid size 0 != 24

The .userspacesize in kernel/net/ipv4/netfilter_ipv4/ipt_quota.c does 
not match the .size in iptables/extensions/libipt_quota.c.

> iptables 1.3.5 source is from ftp://ftp.netfilter.org/pub/iptables.  (Is this
> the correct version of iptables to use or should I be using the latest version
> from the snapshot directory on the ftp server?)


Jan Engelhardt
-- 

