From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: iptables with policy routing
Date: Sat, 13 Nov 2004 02:45:04 -0500
Message-ID: <4195BB80.5060702@newkirk.us>
References: <41939AD2.602@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41939AD2.602@phreaker.net>
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
To: ro0ot <ro0ot@phreaker.net>
Cc: netfilter@lists.netfilter.org

ro0ot wrote:
> Hi,
> 
> Below is my Linux firewall network configuration: -
> 

> iptables -t nat -A POSTROUTING -s 172.16.0.1 -j SNAT --to-source 1.1.1.10
> iptables -t nat -A POSTROUTING -s 192.168.0.1 -j SNAT --to-source 2.2.2.10
> 
> 
> Below is my split access routing for multiple providers: -
> 
> # First ISP
> ip route add 1.1.1.8/30 dev eth0 src 1.1.1.10 table 1
> ip route add default via 1.1.1.9 table 1
> 
> # Second ISP
> ip route add 2.2.2.8/30 dev eth1 src 2.2.2.10 table 2
> ip route add default via 2.2.2.9 table 2
> 
> #
> ip rule add from 1.1.1.8/30 lookup 1
> ip rule add from 2.2.2.8/30 lookup 2
> 
> # My default choice of gateway
> ip route add default via 1.1.1.9


> When I perform a traceroute from a workstation with the IP address of 
> 192.168.0.1 and gateway 192.168.0.254, I can see the result of the 
> traceroute going through the 1.1.1.9 gateway, why?  It suppose to SNAT 
> to 2.2.2.10 via 2.2.2.9 gateway.

Happens because your default gateway is 1.1.1.9.  2.2.2.9 is only chosen 
when the source IP is 2.2.2.8/30.  Problem is, the routing decision is 
made BEFORE iptables->nat->POSTROUTING changes the source IP.  You will 
have to key your routing rules on the private IPs, like so:

ip rule add from 172.16.0.0/24 lookup 1
ip r a from 192.168.0.0/24 lookup 2

(I've gone through various configurations of a linux gateway router 
connecting multiple private networks to three T1s: bridge and plain 
router, load-balanced and source-routed, and with shaping/routing based 
on fwmarks)

j



> Regards,
> ro0ot
> 
> 
> 
> 


