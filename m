From: Bernd Strebel <b.strebel@digitec.de>
Subject: strange behavior of connlimit matching rules
Date: Tue, 18 May 2004 09:00:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A9B4A4.2000201@digitec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Along with the implementation of a simple rule set ( ACCEPT connections 
if ! --connlimit-above nan LOG connections if --connlimit-above n) we 
experienced a strange behavior of the connlimit matching module:

Rule #m:   ...-m connlimit   --connlimit-above n -j LOG
Rule #m+1: ...-m connlimit ! --connlimit-above n -j ACCEPT

works fine, while

Rule #m:   ...-m connlimit ! --connlimit-above n -j ACCEPT
Rule #m+1: ...-m connlimit   --connlimit-above n -j LOG

works not (no match on rule #m+1).

Many thanks for any explanation.
Bernd


environment: kernel 2.4.26, iptables 1.2.9, pomng-20040302
============

iptables output (source/dest. stripped, always 0.0.0.0/0)
===============

Chain OUTPUT (policy DROP 9 packets, 560 bytes): OK

num   pkts bytes target     prot opt in     out

1      131  9331 ACCEPT     all  --  *      lo

2      116 11140 ACCEPT     all  --  *      *
        state RELATED,ESTABLISHED

3        5   260 LOG        tcp  --  *      eth0
        mport dports 22 #conn/32 > 2 state NEW
        LOG flags 0 level 4 prefix CONNLIMIT

4        5   260 ACCEPT     tcp  --  *      eth0
        mport dports 22 #conn/32 < 2 state NEW

5        9   560 LOG        all  --  *      *
        LOG flags 0 level 4 prefix DROP-AT-END-OF-CHAIN


Chain OUTPUT (policy DROP 10 packets, 612 bytes): CONNLIMIT not logged!

num   pkts bytes target     prot opt in     out

1      138  9950 ACCEPT     all  --  *      lo

2      124 11648 ACCEPT     all  --  *      *
        state RELATED,ESTABLISHED

3        0     0 ACCEPT     tcp  --  *      eth0
        mport dports 22 #conn/32 < 2 state NEW

4        0     0 LOG        tcp  --  *      eth0
        mport dports 22 #conn/32 > 2 state NEW
        LOG flags 0 level 4 prefix CONNLIMIT

5       10   612 LOG        all  --  *      *
        LOG flags 0 level 4 prefix DROP-AT-END-OF-CHAIN


