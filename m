From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: netfilter Digest, Vol 6, Issue 22
Date: Wed, 12 Jan 2005 08:47:06 -0600 (CST)
Message-ID: <200501121447.j0CEl6p1027271@pog.tecnopolis.ca>
References: <200501110024.j0B0Os0S018657@pog.tecnopolis.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501110024.j0B0Os0S018657@pog.tecnopolis.ca>
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: sschmidt@compass.net.nz

> From: "Curby ." <kirbysdl@hotmail.com>
> 
> In what order should i have /etc/init.d/network and my iptables setup script 
> (henceforth called "iptables") start?

I've though about this also.  In RH/FC it defaults to iptables then
network.  This seems the only safe and sensible solution.

> If iptables starts before network, then network could override settings in 
> /proc/sys/net when it calls upon /etc/sysctl.conf.   Additionally, it would 

I haven't given that issue much thought.  I have not yet run into any
conflicts or difficulties.

> be harder to identify dynamic IPs, additional IPs set with "ip addr add," 
> etc.  simply because the network isn't up yet.

I too need to identify dynamic IP's and so I do exactly what you
suggested by running iptables before network and my iptables script
detects that the net is down and queues itself to run again every 30
seconds until successful (ie: can resolve domain names).

This has been very successful for me.


