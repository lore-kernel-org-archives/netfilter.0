From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Not forwarding?
Date: Mon, 29 Mar 2004 16:26:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040329162620.50afb911@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403282154.17071.Antony@Soft-Solutions.co.uk>
	<20040328170733.23247779@darna.vectec.net>
	<200403282224.12071.Antony@Soft-Solutions.co.uk>
	<20040329155147.4fa98da1@darna.vectec.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040329155147.4fa98da1@darna.vectec.net>
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

It works once i ran this:

iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 22 -j DNAT --to 192.168.0.2:22

Why did i need that? Do i still need my other rules? (in my filter - forward chain)?

On Mon, 29 Mar 2004 15:51:47 -0400,
Someone named Cody Harris <hchs@ns.sympatico.ca> wrote:

> It didn't work. I'm getting somebody on my ISP to test it (offsite). The firewall IPs are: 10.30.7.147 for net (my ISP nats it) and 192.168.0.1 and my box i want to forward to is 192.168.0.2. It still doesn't work. Here's an updated ruleset:
> 
> 
> Chain INPUT (policy ACCEPT 3787 packets, 1815K bytes)
>  pkts bytes target     prot opt in     out     source               destination
>     0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:10000
>     0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:631
>     3   144 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:http
>     0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:smtp
>     0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:ftp
>     0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp echo-reply
>     0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp destination-unreachable
>     0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp redirect
>     0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp echo-request
>     0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp time-exceeded
>     0     0 DROP       icmp --  eth0   any     anywhere             anywhere
> 
> Chain FORWARD (policy DROP 36 packets, 2291 bytes)
>  pkts bytes target     prot opt in     out     source               destination
>     0     0 ACCEPT     all  --  any    any     anywhere             anywhere           state RELATED,ESTABLISHED
>     0     0 ACCEPT     tcp  --  any    any     192.168.0.2          anywhere           tcp dpt:ssh
> 
> Chain OUTPUT (policy ACCEPT 3996 packets, 585K bytes)
>  pkts bytes target     prot opt in     out     source               destination
> 
> 
> 
> -- 
> +------------------+-----------------------------+
> | Cody Harris      | --------------------------- |
> | ---------------- | --------------------------- |
> +------------------+-------+---------------------+---+
> | *Sigh*. No key.                                    |
> +----------------------------------------------------+
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

