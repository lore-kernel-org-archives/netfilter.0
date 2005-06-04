From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Fedora 3, missing ip_conntrack_ftp & ip_nat_ftp
Date: Sat, 04 Jun 2005 18:39:06 -0400
Message-ID: <1117924745.2105.2.camel@grendel>
References: <1117901467.2143.15.camel@grendel>
	<20050604211715.GA20974@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050604211715.GA20974@bender.817west.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2005-06-04 at 17:17, Jason Opperisano wrote:
>
> /sys/modules?  huh?  try:
> 
> ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/*_ftp*

That did the trick. Running insmod while referencing that directory
caused the appropriate /sys/modules entry to get created. That was the
piece I was missing.

Thanks!
Chris



