From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Mon, 10 Oct 2005 00:02:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510092357070.30581@filer.marasystems.com>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510071407.58851.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510072013130.17798@filer.marasystems.com>
	<200510072133.37280.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510072133.37280.marek.zachara@conexe.pl>
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
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Fri, 7 Oct 2005, Marek Zachara wrote:

> Well, the router startup procedure is like this:
> 1) boot up core system (eth0 built-in kernel and enabled as the router root is
> on nfs via eth0)
> 2) set up iptables rules
> 3) bring up eth1

Try adding rules before eth0 is set up, rejecting all traffic except the 
traffic you need for booting until the real rules is loaded later on.

> so before step (3) any packets destined to internet shall be returned with
> 'destination unreachable'. But i don't know if this could create the contrack
> entry.

Good question. Should be easy to try if you pause your system before 3. If 
you see the entry in /proc/net/ip_conntrack before bringing up eth1 then 
you are in trouble.

> the IAX udp packets are being sent all the time, even before the
> router boots up - so its very likely such packet may hit the router before
> netfilter (and SNAT) is configured.

Ok, which may be troublesome..

> But from what i understand, the UDP NAT shall refresh every 180 seconds(?)

No. As long as there is traffic the same NAT mapping stays forever.

Only if there has been complete silence in this connection for 180 seconds 
or more is a new NAT mapping created.

> so after 3 minutes the packets shall be nat-ed correctly. But maybe if 
> there is a constant flow of packets it can sustain the contrack entry?

Correct. As long as there is traffic nothing will change.

> But how to explain then that the rule has been hit 8 times within 6 
> hours? As far as i understand once this rule is hit, it shall then start 
> to NAT packets correctly...?

Good question what these 8 hits are. Other matching traffic streams 
perhaps?

> P.S. Please let me know if you want me to set up some special test procedure
> to troubleshoot this issue.

As of today I am fairly certain the issue is related to your configuration 
and not a general problem.

Regards
Henrik

