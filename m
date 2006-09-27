From: Lucas Diaz <lucasdiaz@eternet.cc>
Subject: NAT with CONNMARK
Date: Wed, 27 Sep 2006 17:37:41 -0300
Message-ID: <451AE115.4050009@eternet.cc>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm using CONNMARK with layer7 for doing traffic shaping, and it works 
great.
My problem is that i want to SNAT packets marked with CONNMARK (actually 
i'm doing "-m mark --mark X -j CONNMARK --save-mark"), and no packets go 
through the rule "iptables -t nat -A POSTROUTING -m connmark --mark X -j 
SNAT --to x.x.x.x".
I also tried using "-m mark --mark X -j SNAT --to x.x.x.x".
All the marking is done on mangle table PREROUTING chain.

What's the difference between MARK and CONNMARK?

I've also got another scenario with -j MARK on mangle table POSTROUTING 
chain, and SNAT and it works fine.

I've searching in the web, and it seems to be all fine, but it doesn't work.

Thanx a lot.

