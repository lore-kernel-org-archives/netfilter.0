From: Martin Kahlert <mkcon@gmx.de>
Subject: Why do my packets not pass the (nat) OUTPUT chain?
Date: Thu, 1 Dec 2005 09:03:25 +0100
Message-ID: <20051201080325.GA10367@keksy.local>
Reply-To: mkcon@gmx.de
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi!

i'm still struggling to redirect connections to outside hosts back to
my local machine.

# cat /proc/sys/net/ipv4/ip_forward 
1

# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 37 packets, 8394 bytes)
 pkts bytes target     prot opt in     out     source     destination   

Chain POSTROUTING (policy ACCEPT 79 packets, 4870 bytes)
 pkts bytes target     prot opt in     out     source     destination   

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source     destination   
    0     0 REDIRECT   tcp  --  any    any     anywhere   66.249.93.104  tcp dpt:smtp

# telnet 66.249.93.104 25
<CTR-C>  (can't work on www.google.com)

# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 37 packets, 8394 bytes)
 pkts bytes target     prot opt in     out     source     destination   

Chain POSTROUTING (policy ACCEPT 83 packets, 5110 bytes)
 pkts bytes target     prot opt in     out     source     destination   

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source     destination   
    0     0 REDIRECT   tcp  --  any    any     anywhere   66.249.93.104  tcp dpt:smtp

seems, that my packets from the local machine only pass the POSTROUTING chain.

Why can't i redirect this traffic? Did i miss anything essential?

Thanks for any help in advance,
Martin.

