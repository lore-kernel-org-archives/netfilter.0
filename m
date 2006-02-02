From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: Can't get MARK target and tc ingress qdisc to work together.
Date: Thu, 02 Feb 2006 13:29:45 -0900
Message-ID: <43E287D9.7010102@aptalaska.net>
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

I must be missing something simple here:

This works just fine:

tc qdisc add dev ppp0 handle ffff: ingress
tc filter add dev ppp0 parent ffff: protocol ip prio 50 u32 match ip
sport 80 0xffff police rate 100kbit burst 10k drop flowid :1

It throttles ingress traffic on port 80 and downloads slow down as tcp
backs off.

However this doesn't work at all, and it should be the same thing:

iptables -t mangle -A PREROUTING -p tcp --sport 80 -j MARK --set-mark 99
tc qdisc add dev ppp0 handle ffff: ingress
tc filter add dev ppp0 parent ffff: protocol ip prio 50 handle 99 fw
police rate 100kbit burst 10k drop flowid :1

So I can define port 80 traffic just fine in the tc filter, but for some
reason iptables isn't marking the traffic or the ingress qdisc doesn't
see the marked traffic.

Anyone have any ideas?

schu

