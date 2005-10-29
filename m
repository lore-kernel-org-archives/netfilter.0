From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Netfilter IPT_RETURN & IPT_CONTINUE
Date: Sat, 29 Oct 2005 23:47:24 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510292340370.15219@filer.marasystems.com>
References: <4360640F.8080205@supportivo.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4360640F.8080205@supportivo.org>
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
To: Daniel Ivanov <sertys@supportivo.org>
Cc: netfilter@lists.netfilter.org

On Thu, 27 Oct 2005, Daniel Ivanov wrote:

> In a simple hook , when i return IPT_RETURN after the userspace processing it 
> does not have the effect or a RETURN jump for example. It says to the kernel 
> : DROP THIS PACKET.

Are we talking about a queue userspace application here? Or a custom 
netfilter hook?

queue handlers, just as netfilter hooks, should return core netfilter 
verdicts (NF_xxx), not iptables verdicts (IPT_xxx).  Only iptables 
targets/matches may return iptables verdicts.

> If i pass continue : i continue traversing the chain. The simple effect that 
> i want to achieve is to just accept the packet and stop traversing the 
> current chain. Is that possible? I'm rather new to nf hooking and that's why 
> i ask.

QUEUE is by design a terminal target and terminates the entire table it is 
called from, causing the packet to be sent to userspace for further 
processing. When the packet returns it will continue on the next netfilter 
handler at that hook or continue in the TCP/IP stack if there is no 
additional handlers at this hook.


If your question is if it is possible for a netfilter module to stop 
processing of further netfilter modules attached to the same hook then no, 
not without stealing the packet (NF_STOLEN verdict, similar to DROP but 
indicates you have taken over processing of this packet)

Regards
Henrik

