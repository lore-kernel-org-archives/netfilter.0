From: ulisses <ulisses.alonso@rediris.es>
Subject: -j DNAT/REDIRECT with localy generated packets doesn't traverse
	OUTPUT chain?
Date: Wed, 15 Feb 2006 14:18:24 +0100
Message-ID: <20060215131824.GA6197@tux.rediris.es>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello

I have a local process that generates packets directed to localhost from
a spoofed source address (which is not local to the machine)

If I try a simple

iptables -t nat -A OUTPUT -p udp --dport 9995 -j DNAT --to-destination 127.0.0.1:$nuevopuerto

packets doesn't traverse the rule, and I don't see the couters in the default ACCEPT 
policy in the OUTPUT chain doesn't increase:

iptables -t nat -L -n -v

Chain OUTPUT (policy ACCEPT 985 packets, 158K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DNAT       udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:9995 to:127.0.0.1:10000

But If I see the OUTPUT chain in the filter table, the counters increase 
as spected 1000 packets/second.

So, what I'm doing wrong?

I also tried trying with -j REDIRECT without success, with several tries.

I think I'm doing fundamentally wrong. But what?

I would like to know how to use the -j TRACE anybody which maybe helps
me understanding what is going out, but I haven't figured out how to use it.

Thanks in advance


	Ulisses

