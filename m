From: Damon Gray <dgray@internap.com>
Subject: Re: problem with connlimit module compile
Date: Thu, 1 Sep 2005 15:08:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0509011506510.14997@dgray-test.acs.internap.com>
References: <006101c5af27$2087e750$dd8069d8@html>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006101c5af27$2087e750$dd8069d8@html>
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
To: Keith <keith@acsinc.net>
Cc: netfilter@lists.netfilter.org


You are going to want to go with a much newer version of POM for the 
connlimit module, I have only tested the latest version with 2.6.11.X, but 
AFAIK it would work on later versions as well.

Good luck

-Damon-

On Thu, 1 Sep 2005, Keith wrote:

> I'm using kernel 2.6.13 and iptables 1.3.2 and
> patch-o-matic ng-20040621
>
> I'm getting an error when I try to patch and compile to use
> connlimit from the patch-o-matic base. the errors look like this:
>
> In function count_them:
> struct ip_conntrack_tuple_hash has no member named ctrack
>
> And sure enough I find the ctrack pointer was removed here:
> http://lists.netfilter.org/pipermail/netfilter-devel/2005-January/018147.htm
> l
>
>
> I started digging into the source and find it non-trivial
> Any suggestions on a work around?
>
>
>
>
>
>

