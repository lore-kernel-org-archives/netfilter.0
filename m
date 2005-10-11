From: Ignatich <ignatich@gmail.com>
Subject: owner based routing
Date: Tue, 11 Oct 2005 17:57:04 +0400
Message-ID: <379640488.20051011175704@gmail.com>
Reply-To: Ignatich <ignatich@gmail.com>
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

Hello,

I have a following problem. My goal is to allow traffic originating
from specific user/group to be routed via different gateway.

Here's my setup:
eth0 - default internet interface, ip z.z.z.z
eth1 - LAN, ip y.y.y.y

In LAN I have a hardware ADSL router with ip x.x.x.x.

Since ipt_owner does not work in PREROUTING chain and fwmark is
pointless, I thought that ipt_ROUTE from p-o-m can help me.

Here's what I did:

iptables -t mangle -A OUTPUT -o eth0 -m owner --gid-owner adsl -j
ROUTE --gw x.x.x.x --oif eth1

But it did not work. I belive this happened because matched packets
still had z.z.z.z as their source address.

So i tried that:

iptables -t mangle -A OUTPUT -o eth0 -m owner --gid-owner adsl -j
ROUTE --gw x.x.x.x --oif eth1 --continue
iptables -t nat -A POSTROUTING -o eth1 -m owner --gid-owner adsl -j
SNAT --to-source y.y.y.y

But still no luck. :(

Any ideas how to solve my problem?

-- 
 Ignatich                          mailto:ignatich@gmail.com


