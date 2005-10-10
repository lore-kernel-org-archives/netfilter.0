From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Mon, 10 Oct 2005 14:42:13 +0200
Message-ID: <200510101442.13454.marek.zachara@conexe.pl>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510072133.37280.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510092357070.30581@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510092357070.30581@filer.marasystems.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 10 of October 2005 00:02, you wrote:
> On Fri, 7 Oct 2005, Marek Zachara wrote:
> > Well, the router startup procedure is like this:
> > 1) boot up core system (eth0 built-in kernel and enabled as the router
> > root is on nfs via eth0)
> > 2) set up iptables rules
> > 3) bring up eth1
>
> Try adding rules before eth0 is set up, rejecting all traffic except the
> traffic you need for booting until the real rules is loaded later on.
>
I did try. However even adding blocking (-p udp -j DROP) at PREROUTING and 
keeping such rule for 5 min doesn't clean the conntrack - somehow the entry 
is 'sustained' with the incoming packets even if they are being dropped early 
in the chain.

>
> As of today I am fairly certain the issue is related to your configuration
> and not a general problem.
>
Well as i wrote in another post, i have solved the problem by cleanning the 
contrack table from userspace after the rules are set up.

However i think this is quite a serious problem - seems that if there is any 
traffic coming at any interface before the nat rules are set up, this can 
effectively disable certain SNAT rules and thus render some services 
unusable. This is a very attractive DoS opportunity.

regards,
Marek

