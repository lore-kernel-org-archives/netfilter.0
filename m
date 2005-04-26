From: Dan Wittenberg <daniel-wittenberg@starken.com>
Subject: Re: NAT stops working (more)
Date: Tue, 26 Apr 2005 10:25:46 -0500
Message-ID: <1114529146.25369.13.camel@tux.its.uiowa.edu>
References: <1114466195.28469.9.camel@plasma.starken.com>
	<426DA0C1.9000004@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426DA0C1.9000004@riverviewtech.net>
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
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Well, it's not that it doesn't work period, it's that over time
eventually it stops.  It seems to be the total amount of traffic going
through, though I don't know what that number is.  So say I reset the
firewall, and I pound some web servers behind it and so nat would stop
working in say 5-10 minutes.  If I just reset it and walk away at 8pm,
it could be hours before it stops working.  Normally I would agree, that
sounds like a firewall, except if it were iptables it would either work,
or not, and not stop after some amount of time.  

Thanks,
Dan

On Mon, 2005-04-25 at 21:00, Taylor Grant wrote:
> Daniel Wittenberg wrote:
> > The only ideas people came up with was the conntrack table, but I know
> > that's not a problem (I see no errors at all, plus manually checking it
> > is fine).  So now I'm wondering how I can debug netfilter itself?
> > kernel debugger?  I can see the packets come into the host using
> > tcpdump/ethereal, but they don't go out the internal interface, so not
> > sure how to "track" the packet within the kernel.  Ideas?
> > 
> > Thanks,
> > Dan
> 
> Dan, silly question, but are you sure that your firewall is not somehow interfering with the traffic?  Could you do an iptables dump of the filter, mangle, and nat tables the next time that the traffic exhibits this failure?  If you could post that (scrubbed of sensitive IPs if needed) as well as some of your network config (interfaces and IP addresses, upstream gateways, etc) we might be able to do more for you.  I know that any time that I have had any thing just not work it has usually been a firewall issue.  You say that you are playing with your routing cache, so we might need an output of your routing tables as well, route -n should do the trick unless you are doing any advanced routing.
> 
> 
> 
> Grant. . . .

