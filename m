From: Jason Opperisano <opie@817west.com>
Subject: Re: Unicast packets to multiple destinations  -only-
Date: Thu, 18 Nov 2004 08:32:11 -0500
Message-ID: <1100784731.3848.10.camel@hubcap.ljm.dom>
References: <419C6FF3.9070908@lucomp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419C6FF3.9070908@lucomp.net>
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

On Thu, 2004-11-18 at 04:48, Luigi Corsello wrote:
> Hi all,
> 
> I got 3 IPs in one interface (ip addr add, not aliasing), and wanted to 
> only allow unicast packets to any of them (and/or their subnet in one 
> case, to allow broadcasts for the local net).
> Aim: no broadcasts, no multicast, spoofing prevention?.
> 
> You can't have multiple -d in rules. My quick solution was 3 tables
> (this is a sample):
> 
> iptables -N ta
> iptables -N tb
> iptables -N tc
> 
> iptables -A tc -d ! $ip3 -j DROP
> iptables -A tb -d ! $ip2 -j tc
> iptables -A ta -d ! $ip1 -j tb
> 
> iptables -A INPUT -j ta
> 
> It works, much junk stays out.  All services work.
>  From the list point of view, is this insane(a) stupid(b) or clever(c)? 
> and why?

if it works, then it's neither insane nor stupid.  just to add a
viewpoint, if you asked me how to accomplish the same, i would have
probably answered:

  iptables -N scrub_interface_0
  iptables -A scrub_interface_0 -d ${ip1} -j RETURN
  iptables -A scrub_interface_0 -d ${ip2} -j RETURN
  iptables -A scrub_interface_0 -d ${ip3} -j RETURN
  iptables -A scrub_interface_0 -j DROP

  iptables -A INPUT -i ${int0} -j scrub_interface_0

from my perspective--i can figure out what the above is doing much more
quickly than i can looking at your method.  but it's really just
that--personal preference.

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
	--The Simpsons


