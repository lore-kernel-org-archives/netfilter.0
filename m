From: Jonathan Trostle <jtrostle@world.std.com>
Subject: question on DNAT for locally generated outgoing packets
Date: Wed, 31 Dec 2003 19:16:03 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401010016.TAA19481@world.std.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: jtrostle@world.std.com


Hi,

Is is possible to use iptables to rewrite the destination IP address
for some outgoing packets on a host?

Section 6.3.7 of the NAT-HOWTO seems to suggest that this only works
for packets with destination address 127.0.0.1. Or has this been 
fixed or is there another way to do it?

Why would it only work for 127.0.0.1?

Please reply back to my address since I'm not subscribed to the list.


Thanks,
Jonathan

