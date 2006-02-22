From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: Automagic proxy arp?
Date: Wed, 22 Feb 2006 12:28:07 -0500
Message-ID: <43FC9F27.80907@certicom.com>
References: <43FC8213.2030606@certicom.com>
	<51364.193.173.147.3.1140624811.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51364.193.173.147.3.1140624811.squirrel@webmail.sterenborg.info>
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


Rob Sterenborg wrote:
>         .1        .2        .3       .4-.254
> +-------+         +---------+
> +   M   + ------ eth1  FW  eth0 ---- local subnet
> +-------+         +---------+

> The "linux arp man page"... Not the iptables man page.
> 
> 
>>Does anyone know how to set up iptables on FW to enable this "automagic"?
> 

It turns out the trick is to add an explicit route on the FW to machine M such
as "route add -host M/32 dev eth1" whereas the default route to local subnet is
eth0. Of course, you must also enable proxy_arp for both eth1 and eth0.

Given this configuration, the FW will proxy arp for all machines on local subnet
(on eth1), and will proxy arp for M (on eth0).

> 
> Aren't you confusing things ? arp != iptables.
>>From man arp(8) :
> 
> NOTE: As of kernel 2.2.0 it is no longer possible to set an ARP entry for an
> entire subnet. Linux instead does automagic proxy arp when a route exists and
> it is forwarding. See arp(7) for details.
> 
> 

I only thought the solution may lie in iptables because the only systems related
to forwarding in linux that I know of is 1. the ip_forward option in the kernel
and 2. iptables can define forwarding rules.

As such, I assumed that when the arp man pages write about forwarding enabling
automagic proxy arp, it relates to iptables.

I also thought about turning FW into a bridge but there may be some degradation
because both interfaces with have to be in promiscuous mode.

> Why is it such a problem to set the default gateway of "M" to the firewall ?
> You say it works when you add a routing rule for for the firewall, but if the
> firewall is the only machine that "M" can reach, you might as well use it as
> default gateway.

Eventually, the subnet where M is sitting will have more than one machines (say,
N, O, P). For example, as a DMZ. It would be nice to have M, N, O, and P reach
each other as well as the rest of local subnet without adding customized routing
rules on each of them.

Actually, for a DMZ the configuration would be reversed. You want the local
subnet to reach M, N, O, P and not vice versa (by using iptables to only
allowing forwarding to start from the eth0 side). In this case, it would not be
feasible to add a special route for all the local boxes for M, etc. It looks
like I can achieve the same thing by just adding 4 route entries on FW for M, N,
O, P.

Regards,

Chinh

