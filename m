From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: (no subject)
Date: Fri, 16 Apr 2004 15:00:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002f01c423b2$bff5bbc0$1202a8c0@admin>
References: <E1BEJWp-0005UN-EQ@ht8b10.server4sale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> I was wondering if anybody could tell me how to setup a rule that
> forwards all packets from a particular IP, regardless of the ports,
> on to another machine?

You mean to DNAT connections to a server behind the firewall ?

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISED -j ACCEPT
iptables -A FORWARD -d <dest_ip> -j ACCEPT
iptables -t nat -A PREROUTING -s <src_ip_range> -j DNAT <dest_ip>
echo 1 > /proc/sys/net/ipv4/ip_forward

For <src_ip_range>, see below.

> I was also wondering if it is possible to forward an entire IP range,
> or the DNS using wildcards? For example forwarding all connections
> from *.aol.com regardless of the port onto a specific IP? If this is
> possible, could anybody tell me how I would go about it?

Using a range is possible :
- use subnets like /24 or 255.255.255.0
- use the iprange patch from POM. You will have to patch your kernel for
that to work.
See http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-iprange

You cannot use wildcard domain lookups in iptables rules so you'd have to
find out which ip ranges you want to match yourself.


Gr,
Rob


