From: David Cannings <lists@edeca.net>
Subject: Re: Synfloods - SNAT slow down
Date: Fri, 23 Apr 2004 08:01:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404230801.57077.lists@edeca.net>
References: <005201c428d1$a2ab2ea0$2800a8c0@jupiter>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005201c428d1$a2ab2ea0$2800a8c0@jupiter>
Content-Disposition: inline
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

On Friday 23 April 2004 02:23, krv wrote:
> We have a Linux gateway (2.4.22) which does NAT for all local hosts.
> Where there is ICMP or SYN floods to be forwarded, the gateway starts
> slowing down an there will be serious drop in packets being forwarded.

You could try using the limit match in your FORWARD chain, with --limit 
and --limit-burst to limit the number of ICMP or packets with only the 
SYN flag set per second.  Your gateway would still have to process the 
packets, at least as far as deciding to drop them, but would not have to 
forward them on so you might see an improvement in performance.

If you do examine this route, be careful you don't quench good ICMP 
packets as there is no retransmission in ICMP and you'll never know if 
certain wanted messages didn't get through.  For example, host X is 
sending you an ICMP flood so netfilter starts to drop ICMP packets, but 
host Y tries to send you a host unreachable message.

Also don't forget that even if you decide not to forward the packets they 
are still there "on the wire", thus you will not see any improvement with 
external speeds.

David

