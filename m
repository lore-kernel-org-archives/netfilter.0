From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Temporary forwarding proxy?
Date: Thu, 25 Sep 2003 09:26:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309250926.36492.gdh@acentral.co.uk>
References: <200309241035.04343.gdh@acentral.co.uk> <1064475439.1906.528.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064475439.1906.528.camel@alpha.newkirk.us>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 25 September 2003 08:37, Joel Newkirk wrote:

> iptables -t nat -A PREROUTING -d 1.1.1.1 -p tcp --dport 80 -j DNAT --to
> 2.2.2.2 

> iptables -t nat -A POSTROUTING -d 2.2.2.2 -p tcp --dport 80 -j SNAT 
> --to 1.1.1.x (firewall IP) and probably:

> iptables -A FORWARD -d 2.2.2.2 -p tcp --dport 80 -j ACCEPT

> and make sure you're accepting ESTABLISHED and RELATED state in FORWARD, or
> add a return traffic rule to FORWARD if you're stateless:

> iptables -A FORWARD -s 2.2.2.2 -p tcp --sport 80 -j ACCEPT

Morning :)

Thanks for the reply - I was on the verge of implementing an application level 
proxy rather than doing it in iptables, which I feel is much more elegant and 
reliable....

I'd love to say this worked, but alas no - when I try to connect from the 
outside world on 1.1.1.1:80 I simply get no connection - no 'connection 
refused' - just no response at all....and I don't see anything in the 
firewall logs about those packets dying :/

I already use stateful firewalling and accept EST and REL connections, but 
tries with the forceful --sport 80 -j ACCEPT with no luck :/

Any other ideas? :)

My 'nat' table (with real IPs and a couple of other DNAT internal redirects - 
one big server at .219 replaced two aging ones at .16 and .18) is now:

The local firewall at .247 is a bridge-fw, so the .247 address is bound to br0 
which consists of eth0 and eth1...

Chain PREROUTING (policy ACCEPT 92M packets, 8370M bytes)
 pkts bytes target     prot opt in     out     source               
destination
 9217  517K DNAT       tcp  --  eth0   *       0.0.0.0/0            
194.200.209.2      tcp dpt:25 to:194.200.209.13:25
 215K   11M DNAT       tcp  --  eth0   *       0.0.0.0/0            
194.200.209.18     tcp dpt:80 to:194.200.209.219
 277K   14M DNAT       tcp  --  eth0   *       0.0.0.0/0            
194.200.209.16     tcp dpt:80 to:194.200.209.219
    0     0 DNAT       tcp  --  *      *       0.0.0.0/0            
194.200.209.215    tcp dpt:80 to:213.2.4.33

Chain POSTROUTING (policy ACCEPT 62M packets, 3373M bytes)
 pkts bytes target     prot opt in     out     source               
destination
    5   268 SNAT       tcp  --  *      *       0.0.0.0/0            213.2.4.33         
tcp dpt:80 to:194.200.209.247

Chain OUTPUT (policy ACCEPT 6966 packets, 681K bytes)
 pkts bytes target     prot opt in     out     source               
destination
<empty>

Cheers,
Gavin.

