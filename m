From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Tue, 12 Apr 2005 00:06:59 -0400
Message-ID: <1113278818.2151.87.camel@grendel>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
	<425AF2B7.2050402@riverviewtech.net> <1113266214.2111.46.camel@grendel>
	<425B3354.2030807@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425B3354.2030807@riverviewtech.net>
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
To: gtaylor@riverviewtech.net
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2005-04-11 at 22:32, Grant Taylor wrote:
>
> One reason that some institutions decide to DROP verses REJECT is so that someone can not spoof their source IP while performing some sort of attack

I don't think I quite follow what you are saying. I'm not sure how using
drop or reject would have any effect on someone's ability to use your
address space as the source IP in a spoofed packet.

> the institutions system expecting the REJECT to go to the spoofed source IP thus becoming part of what I think is considered a reflected attack.

If I follow what you are saying here, the concern is the returning ICMP
host unreachables may be used as part of a DoS. Is this correct? 

If so, the concern is pretty minimal. Packet size is small, only 56
bytes in size, so bandwidth utilization is small. Unsolicited ICMP
errors are going to be quickly discarded by the receiving system, so its
not going to cause much of a CPU hit on the target. Unfortunately there
are far too many other ways of performing a DoS that would be much more
effective and efficient. 

> These issues and many more like them are some of the things that I would like to spend some more time reading about and gaining a better understanding

Ya, geek stuff is cool. :D

Chris



