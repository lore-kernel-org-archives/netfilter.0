From: cifroes <cifroes@netcabo.pt>
Subject: target ACCEPT in maccheck chain, forward chain is still used?
Date: Fri, 09 Jun 2006 15:10:31 +0100
Message-ID: <44898157.8080802@netcabo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

hi,

I'm configuring a machine with iptables to serve as "router" and I have
a rather strange question.

I have to do mac check on one of the networks the router is connected so
I have something like this:
iptables -t mangle -N maccheck
iptables -t mangle -I PREROUTING -i eth1 -j maccheck
iptables -t mangle -A maccheck -m mac -j ACCEPT --mac-source AA:BB:CC...etc
iptables -t mangle -A maccheck -j DROP

(this is not pasted so ignore the typos)

I also have many rules in FORWARD chain.


My question is simple: what happens to the packet when it's marked as
ACCEPT by the 3rd rule? The rules that apply to that packet in the
FORWARD chain are still used or the ACCEPT stuff just overrides everything?


My tests say the FORWARD RULES are still used, am i correct?


(this is kind of a discussion with a mate, so if you can add
documentation to prove it, i will appreciate it...)

Many thx in advance


