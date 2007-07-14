From: David Lang <david.lang@digitalinsight.com>
Subject: Re: iptables 1.2 in an AMD64 bit kernel howto ??
Date: Sat, 14 Jul 2007 12:40:52 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0707141228520.18708@qynat.qvtvafvgr.pbz>
References: <4697479B.9040707@ditro.com><200707130949.l6D9nBlY008820@toshiba
	.co.jp><Pine.LNX.4.63.0707131252130.17664@qynat.qvtvafvgr.pbz>
	<200707141835.l6EIZGbt012963@toshiba.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200707141835.l6EIZGbt012963@toshiba.co.jp>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Cc: netfilter@lists.netfilter.org

On Sun, 15 Jul 2007, Yasuyuki KOZAKAI wrote:

> From: David Lang <david.lang@digitalinsight.com>
> Date: Fri, 13 Jul 2007 12:52:37 -0700 (PDT)
>
>>> The old kernels have '64bit kernel and 32bit userland' problem.
>>> Your iptables is 32bit binary (try readelf -a `which iptables`) ? If so,
>>> building 64bit binary of iptables will solve the problem. Upgrading the
>>> recent kernel should also solve it, of cause.
>>
>> what kernel versions are recent enough to have this problem solved?
>
> I think 2.6.22. The compat layer sent into 2.6.21, but a fix was
> needed and it seems not to be in 2.6.21.x yet.

I'm not trying to pick on you, this is a common failing on the kernel mailing 
list.

but guys, saying "Upgrading to a recent kernel should also solve it" when the 
kernel version that fixes it was released within the last week is "a recent 
version" it's "the latest and greatest, mostly untested version that you won't 
find in any distro becouse it's so new"

at least this time the "recent version" is actually a released version, not a 
point in CVS or an -rc like one of the similar discussions that came up 
recently.

Thanks for the info. this is a good reason for me to skip rolling 2.6.20 and 
2.6.21 into production and move to testing 2.6.22 instead.

David Lang

