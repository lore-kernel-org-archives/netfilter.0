From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: limit extension problem
Date: Mon, 16 Jul 2007 18:51:34 +0200
Message-ID: <469BA216.6000802@unipex.it>
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

Hi all,
I'm on debian etch with the default kernel (iptables 1.3.6 and 2.6.18).

I'm trying the limit extension, but the invert flag doesn't work like
the man page say:
"""
iptables -t filter -A FORWARD -m mark --mark 2 -p icmp --icmp-type 8 -m
limit ! --limit 20/min -j ACCEPT
iptables v.1.3.6: limit does not support invert
"""
What I want it's to "limit" the log for icmp protocol to 20/minute

What can I do?

Thanks,
Michele

