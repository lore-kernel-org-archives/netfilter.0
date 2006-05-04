From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Is there a way....
Date: Thu, 04 May 2006 21:40:54 +0200
Message-ID: <445A58C6.8060906@plouf.fr.eu.org>
References: <Pine.LNX.4.58.0604301836350.26623@linux.dpsims.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0604301836350.26623@linux.dpsims.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

David Sims wrote :
> 
>   I want to use Linux to do NAT between some 192.168.x.x addresses
> in a routed network on one side and a single 10.0.0.x/24 on the other
> side. I want to do one-to-one NAT but in a dynamic way... such that a
> calling address is NATed into the next available 10.0.0.x/24.... in a
> round robin sort of way... IS there a way to do this using NETFILTER??
> If not NETFILTER, then how??
> 
>   This sort of thing is common in many-to-one NAT (port-address
> translation)... but I need each call to come from a separate NATed IP
> address to support my application (TN3270 session)... It's OK to reuse
> addresses after a call (session) is complete, but each session needs to
> come from it's own fixed (for the duration of the session) IP address....

If by "call" you mean a single TCP connection or UDP flow, maybe you 
could use the standard SNAT target :

iptables -t nat -A POSTROUTING <matches...> \
   -j SNAT --to $ip_range_start-$ip_range_end

The first connection will be SNATed with $ip_range_start, the next one 
$ip_range+1 and so on until $ip_range_end, then $ip_range_start again in 
a round-robin way (even if it is already used). You must ensure that 
there will never be more simultaneous connections than the number of 
available addresses in the SNAT address range. Note that consecutive 
connections from the same source address will be SNATed with different 
addresses.

