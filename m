From: "Jim Gifford" <maillist@jg555.com>
Subject: Question -- Priorities
Date: Tue, 23 Mar 2004 01:24:39 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ee01c410b8$ab293d50$d100a8c0@W2RZ8L4S02>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

I have a copy of  iptables -L {various} -v. I just want to make sure I have
this right, before I make my changes.


Question 1 - The FORWARD and OUTPUT Chain

The most restrictive rules should be first, then the least. Now the question
is what about TCPMSS, should that be at the top of the Chain??

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 SPOOF      all  --  eth0   any     anywhere             anywhere
    0     0 EXEMPT     all  --  eth0   any     anywhere             anywhere
    0     0 BLACKLIST  all  --  eth0   any     anywhere             anywhere
    0     0 TCP_WRAPPERS  all  --  eth0   any     anywhere
anywhere
    0     0 DENY_ACCESS  all  --  eth0   any     anywhere
anywhere
    0     0 INET_IN    all  --  eth0   eth1    anywhere             anywhere
    0     0 INET_IN    all  --  eth0   ppp0    anywhere             anywhere
    4   420 INET_OUT   all  --  eth1   eth0    anywhere             anywhere
    0     0 INET_OUT   all  --  ppp0   eth0    anywhere             anywhere
    0     0 TCPMSS     tcp  --  any    any     anywhere             anywhere
tcp flags:SYN,RST/SYN TCPMSS clamp t

Chain OUTPUT (policy ACCEPT 1177 packets, 254K bytes)
 pkts bytes target     prot opt in     out     source
destination
  254 22867 INET_OUT   all  --  any    eth0    anywhere             anywhere
   44  1936 TCPMSS     tcp  --  any    any     anywhere             anywhere

Question 2 -- The INPUT Chain

The Most important inputs in first, then the Most restrictive. Is that
correct ?
Chain INPUT (policy DROP 2 packets, 80 bytes)
 pkts bytes target     prot opt in     out     source
destination
  180 29275 SIP        all  --  eth0   any     anywhere             anywhere
  180 29275 SPOOF      all  --  eth0   any     anywhere             anywhere
  180 29275 EXEMPT     all  --  eth0   any     anywhere             anywhere
  180 29275 BLACKLIST  all  --  eth0   any     anywhere             anywhere
  180 29275 TCP_WRAPPERS  all  --  eth0   any     anywhere
anywhere
  180 29275 DENY_ACCESS  all  --  eth0   any     anywhere
anywhere
  180 29275 INET_IN    all  --  eth0   any     anywhere             anywhere
  737 58742 ACCEPT     all  --  any    any     192.168.0.0/24       anywhere
  174 40964 ACCEPT     all  --  lo     any     anywhere             anywhere
    0     0 ACCEPT     udp  --  eth1   any     anywhere             anywhere

Question 3 -- The PREROUTING Chain

    Would TCPMSS need to be at the top of the chain?

Thanx for taking the time to answer my questions.

----
Jim Gifford
maillist@jg555.com


