From: Martijn Lievaart <m@rtij.nl>
Subject: Re: target ACCEPT in maccheck chain, forward chain is still used?
Date: Sun, 11 Jun 2006 14:16:01 +0200
Message-ID: <448C0981.2030807@rtij.nl>
References: <44898157.8080802@netcabo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44898157.8080802@netcabo.pt>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cifroes <cifroes@netcabo.pt>
Cc: netfilter@lists.netfilter.org

cifroes wrote:

>hi,
>
>I'm configuring a machine with iptables to serve as "router" and I have
>a rather strange question.
>
>I have to do mac check on one of the networks the router is connected so
>I have something like this:
>iptables -t mangle -N maccheck
>iptables -t mangle -I PREROUTING -i eth1 -j maccheck
>iptables -t mangle -A maccheck -m mac -j ACCEPT --mac-source AA:BB:CC...etc
>iptables -t mangle -A maccheck -j DROP
>
>(this is not pasted so ignore the typos)
>
>I also have many rules in FORWARD chain.
>
>
>My question is simple: what happens to the packet when it's marked as
>ACCEPT by the 3rd rule? The rules that apply to that packet in the
>FORWARD chain are still used or the ACCEPT stuff just overrides everything?
>
>
>My tests say the FORWARD RULES are still used, am i correct?
>
>  
>

Correct. If a packet is ACCEPTed (which may be implicit by falling of a 
chain, in that case the chains policy is applied), processing continues 
with the next chain. Otherwise processing stops.

So if your PREROUTING chain has a policy of ACCEPT (which it should, 
check with iptables-save command), explicitly ACCEPTing a packet is no 
different from falling of the chain. In that last case you already know 
the rest of the chains are applied (think of an empty chain), so it is 
easy to see that any ACCEPT means to continue with the next chain.

HTH,
M4


