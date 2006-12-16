From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Fri, 15 Dec 2006 22:48:33 -0600
Message-ID: <45837AA1.6030508@riverviewtech.net>
References: <200612121942.19276.mike@v6.gaima.co.uk>	<200612131239.35043.mike@v6.gaima.co.uk>	<45808C72.7060404@riverviewtech.net>
	<200612151134.35827.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612151134.35827.mike@v6.gaima.co.uk>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 12/15/06 05:34, Mike Williams wrote:

<really big snip>

> Routing table now:
> # route -n 
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 90.1...1.64    0.0.0.0         255.255.255.224 U     0      0        0 bond0
> 192.168.131.0   0.0.0.0         255.255.255.0   U     0      0        0 bond1
> 192.168.22.0    90.1...1.69    255.255.255.0   UG    0      0        0 bond0
> 192.168.128.0   0.0.0.0         255.255.255.0   U     0      0        0 bond3
> 192.168.0.0     90.1...1.69    255.255.255.0   UG    0      0        0 bond0
> 192.168.30.0    90.1...1.69    255.255.255.0   UG    0      0        0 bond0
> 192.168.136.0   0.0.0.0         255.255.255.0   U     0      0        0 bond2
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
> 0.0.0.0         90.1...1.69    0.0.0.0         UG    0      0        0 bond0
> 
> Routing table previously:
> # route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 90.1...1.64    0.0.0.0         255.255.255.224 U     0      0        0 br0
> 192.168.131.0   0.0.0.0         255.255.255.0   U     0      0        0 bond1
> 192.168.22.0    90.1...1.69    255.255.255.0   UG    0      0        0 br0
> 192.168.128.0   0.0.0.0         255.255.255.0   U     0      0        0 bond3
> 192.168.0.0     90.1...1.69    255.255.255.0   UG    0      0        0 br0
> 192.168.30.0    90.1...1.69    255.255.255.0   UG    0      0        0 br0
> 192.168.136.0   0.0.0.0         255.255.255.0   U     0      0        0 bond2
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
> 0.0.0.0         90.1...1.69    0.0.0.0         UG    1000   0        0 br0

Sorry, if I have missed it, but which system are these routing tables 
from?  Bridge or LFW?

> # uname -r
> 2.6.17-hardened-r1
> # zgrep BRIDGE_NETFILTER /proc/config.gz
> CONFIG_BRIDGE_NETFILTER=y

This means that you will be able to use IPTables to filter your bridged 
traffic.  Which as I think about it, with out seeing your full IPTables 
rule set, may be the reason some of your packets are having their state 
incorrectly identified.  Can we see a full iptables-save output?



Grant. . . .

