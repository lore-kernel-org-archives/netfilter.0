From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: libipq: problems changing destination port
Date: Mon, 31 Oct 2005 17:35:59 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0510311732330.16659@filer.marasystems.com>
References: <20051031153705.42467.qmail@web52803.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051031153705.42467.qmail@web52803.mail.yahoo.com>
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
To: Lore <skizzo82@yahoo.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Mon, 31 Oct 2005, Lore wrote:

> 16:27:50.094991 IP (tos 0x0, ttl  64, id 39743, offset
> 0, flags [DF], proto: TCP (6), length: 60)
> 192.168.0.4.32788 > geronte.cs.unibo.it.2026: S, cksum
> 0x5034 (correct), 2890202236:2890202236(0) win 5840
> <mss 1460,sackOK,timestamp 14378819 0,nop,wscale 2>
>
> 16:27:50.119230 IP (tos 0x0, ttl  64, id 625, offset
> 0, flags [DF], proto: TCP (6), length: 40)
> 192.168.0.4.32788 > geronte.cs.unibo.it.2026: R, cksum
> 0x36fd (correct), 2890202237:2890202237(0) win 0

Looks like you suceeded just fine, but failed to undo your rewrite on 
return traffic...

in the above return traffic seems missing. The picture I see is


192.168.0.4.32788 -> geronte.cs.unibo.it.2026 (2022) SYN

[not shown]
geronte.cs.unibo.it.2026 -> 192.168.0.4.32788 SYN+ACK

192.168.0.4.32788 -> geronte.cs.unibo.it.2026 RESET

Where I suspect the RESET is actually "I have no interest in talking to 
geronte.cs.unibo.it:2026, go agay please! I want to talk to 
geronte.cs.unibo.it:2022".


Does this make any sense to you?

Regards
Henrik

