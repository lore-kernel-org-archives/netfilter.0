From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: change TTL value
Date: Fri, 9 Apr 2004 09:06:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c41e01$1d3e4fc0$1202a8c0@admin>
References: <20040408161334.GA2396@home.be>
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
To: Roeland Moors <roelandmoors@pandora.be>, netfilter@lists.netfilter.org

> I'm trying to change the value of the TTL field with this line:
> $IPTABLES -t mangle -A PREROUTING -i $INET_IFACE -p igmp -j TTL --ttl-inc
1
>
> But when I try to execute this I have this error:
> iptables: No chain/target/match by that name

Did you compile TTL target support as a module ?
I don't see it in the module list (non-targets deleted), which means you
don't have TTL target support, unless you compiled it into the kernel (but I
don't think so).

> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ULOG.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_TOS.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_TCPMSS.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_SAME.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_REJECT.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_REDIRECT.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_NETMAP.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_MASQUERADE.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_MARK.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_LOG.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ECN.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_DSCP.ko
> /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_CLASSIFY.ko


Gr,
Rob


