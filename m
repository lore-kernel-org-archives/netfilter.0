From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 15:08:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181508.26102.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC654@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC654@csrees-exchsrvb.csrees.usda.gov>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 18 February 2004 2:31 pm, Martinez, Michael wrote:

> --> Please flush the counters on your rules using "iptables -Z;
> --> iptables -Z -t nat", connect to port 8080, and then tell us the output
> --> of "iptables -L -nvx;

I've eliminated most of the lines which have zero packet counts, as they mean 
no traffic was seen:

> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>      131    10661 RH-Firewall-1-INPUT  all  --  *      *       0.0.0.0/0
> 0.0.0.0/0

131 packets in total, all from your user-defined chain...

> Chain RH-Firewall-1-INPUT (2 references)
>     pkts      bytes target     prot opt in     out     source
> destination
>       36     1828 ACCEPT     all  --  lo     *       0.0.0.0/0
> 0.0.0.0/0

36 packets on the loopback interface - any idea what this is?

>       82     5404 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          state RELATED,ESTABLISHED

82 packets ESTABLISHED or RELATED came in

>        1       48 ACCEPT     tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          state NEW tcp dpt:22

One packet on port 22 (SSH)

>        0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0          state NEW tcp dpt:80

NO packets on port 80...

>       12     3381 REJECT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          reject-with icmp-host-prohibited

And 12 rejected packets - maybe LOGging these before rejecting them would be 
helpful in this case, just so we know what they are?

> --> iptables -L -t nat -nvx".
>
> Chain PREROUTING (policy ACCEPT 19 packets, 4845 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        0        0 REDIRECT   tcp  --  *      *       0.0.0.0/0
> 199.128.238.12     tcp dpt:80 redir ports 8080

And NO packets got redirected from 80 to 8080...

I still don't see how you are successfully getting a connection on port 8080 
when there is no rule to allow it.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi


