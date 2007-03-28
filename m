From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Multi ISP router/firewall ...
Date: Wed, 28 Mar 2007 08:18:26 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0703280816500.32661@yvahk01.tjqt.qr>
References: <3564089.276511175009558150.JavaMail.www@wwinf1504>
	<1175061118.21066.34.camel@rayw.internal>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1175061118.21066.34.camel@rayw.internal>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Leach <spoons@rchq.co.za>
Cc: Netfilter <netfilter@lists.netfilter.org>


On Mar 28 2007 07:51, Ray Leach wrote:
>
>I tried both methods - iptables using the ROUTE target as well as using
>iptables to mark the packets, then using iproute2 to lookup and route
>using a table with an ip fwmark rule.
>
>In both cases, the traffic is routed out and return traffic comes back
>in the correct interface, but it does not get NATed backed to the
>client.
>
>iptables -A FORWARD -i eth0 -p tcp --dport 80 -s 10.0.0.3 -j ACCEPT
>iptables -A FORWARD -i eth4 -p tcp --sport 80 -d 10.0.0.3 -j ACCEPT
>
>iptables -A FORWARD -t mangle -p tcp --dport 80 -s 10.0.0.3 -j MARK
>--set-mark 0x4

The routing decision is done before the FORWARDing chain is entered.
Try moving the MARK to INPUT.

>iptables -A POSTROUTING -t nat -o eth4 -p tcp --dport 80 -s 10.0.0.3 -j
>SNAT --to 10.1.0.2
>
>ip rule del fwmark 4 table 4 priority 32000
>ip route flush table 4
>ip route add table 4 default via 10.1.0.1
>ip rule add fwmark 4 table 4 priority 32000
>ip route flush cache
>
>
>What am I doing wrong?
>
>Looking in /proc/net/ip_conntrack I can find an entry for http traffic
>from machine at ip 10.0.0.3 created by the SNAT rule above. When the
>traffic returns back in eth4 it seems to disappear on the firewall ...

Jan
-- 

