From: Luigi Corsello <mlreader@lucomp.net>
Subject: Unicast packets to multiple destinations  -only-
Date: Thu, 18 Nov 2004 10:48:35 +0100
Message-ID: <419C6FF3.9070908@lucomp.net>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi all,

I got 3 IPs in one interface (ip addr add, not aliasing), and wanted to 
only allow unicast packets to any of them (and/or their subnet in one 
case, to allow broadcasts for the local net).
Aim: no broadcasts, no multicast, spoofing prevention?.

You can't have multiple -d in rules. My quick solution was 3 tables
(this is a sample):

iptables -N ta
iptables -N tb
iptables -N tc

iptables -A tc -d ! $ip3 -j DROP
iptables -A tb -d ! $ip2 -j tc
iptables -A ta -d ! $ip1 -j tb

iptables -A INPUT -j ta

It works, much junk stays out.  All services work.
 From the list point of view, is this insane(a) stupid(b) or clever(c)? 
and why?

Cheers,
/lc

