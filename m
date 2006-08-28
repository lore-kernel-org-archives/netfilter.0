From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Wol Magic Packets
Date: Mon, 28 Aug 2006 18:25:41 +0200
Message-ID: <000f01c6cabe$9ac1b1a0$0101000a@tanjian>
References: <J4PLM6$6AFE7408040355E1E49784AB0D8E8AF1@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J4PLM6$6AFE7408040355E1E49784AB0D8E8AF1@libero.it>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

"claudio987@libero.it" wrote:
> Rob Sterenborg... Can you answer me please?

Ah, right. Last time you answered "ok, I'm sorry, I haven't red your
message at all." so then I thought "what's the use to answer"..

If WOL packets really *do* enter your network then I don't know how to
block them.

According to the AMD whitepaper a WOL packet is sent using a subnet
directed broadcast to pass through routers. If you search around the
internet, you find that directed broadcasts can be blocked by using:
"echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts".
But, that's ICMP and UDP seems (commonly) to be used for WOL packets so
this would not help you.


Gr,
Rob


