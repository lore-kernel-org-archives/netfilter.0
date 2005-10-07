From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Fri, 7 Oct 2005 20:16:33 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510072013130.17798@filer.marasystems.com>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510041237.57236.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510061846210.31577@filer.marasystems.com>
	<200510071407.58851.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510071407.58851.marek.zachara@conexe.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Fri, 7 Oct 2005, Marek Zachara wrote:

> here is the conntrack entry:
> irongate:~# cat /proc/net/ip_conntrack |grep 4569
> udp      17 28 src=10.0.0.250 dst=83.16.54.250 sport=4569 dport=4569
> [UNREPLIED] src=83.16.54.250 dst=10.0.0.250 sport=4569 dport=4569 use=1

This connection is not NAT:ed..

> the counter at iptables got only 8 packets, but the router has been up for
> about 6 hours and these packets are being sent every few seconds:
>
> Chain POSTROUTING (policy ACCEPT 73434 packets, 3691K bytes)
> pkts bytes target     prot opt in     out     source              destination
>    8   704 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0
> udp dpt:4569 to:192.168.100.1

And you are positively sure the data stream was not known to conntrack 
before you added the NAT rule?

Unfortunately it is impossible to tell from an conntrack when it was 
created, and since this application is used fixed port numbers once the 
connection gets into conntrack it's very likely the conntrack may have 
been around for quite some time.. Unlike most client traffic where new 
source ports is selected in each connection attemt, making them classify 
as new conntrack entries.

Regards
Henrik

