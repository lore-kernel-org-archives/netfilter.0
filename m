From: Mohan Khurana <mkhurana@andrew.cmu.edu>
Subject: SNAT matching question
Date: Sun, 29 Sep 2002 09:30:16 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44L-027.0209290930010.1180-100000@unix4.andrew.cmu.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everyone,

I'm trying to make a dual-homed router right now.

I'm wondering, if I add two SNAT entries to the POSTROUTING chain of the
nat table, that are completely identical except the the fact that they
have different values for their specification of --to-source, will both of
them get the opportunity to match?  What decides which one matches them?

I am wondering, if packets come in, and I route them, and ensure that
their next-hop is one of the --to-sources, will the rule check both the
source range, and the value of the --to-source?

Example:

iptables -t nat -A POSTROUTING -s 192.168.2.10 -d \! 192.168.2.0/24 -j
SNAT --to-source 1.2.3.4
iptables -t nat -A POSTROUTING -s 192.168.2.10 -d \! 192.168.2.0/24 -j
SNAT --to-source 5.6.7.8

If in my iproute2 configuration, if I ensure that the packet is going out
with source 5.6.7.8 when flowing around, it should match to the second
rule, and skip the first altogether, right?  If I set it to hop to source
1.2.3.4, it should choose the first nat rule, and then skip the second one
altogether, right?

thanks much,

mohan





