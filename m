From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Not forwarding?
Date: Sun, 28 Mar 2004 15:52:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040328155231.32b07799@darna.vectec.net>
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
To: netfilter@lists.netfilter.org

Here's my setup:
My filewall has eth0 and eth1. 0 is ethe net and 1 is my ssh box. Eth0 is 10.30.7.147 and Eth1 is 192.168.0.1...Eth1 is connected to Eth0 on the other box...192.168.0.2.

We have found out ssh isn't forwarding properly. What's the deal?

This is my firewall setup:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp dpt:10000
DROP       tcp  --  anywhere             anywhere           tcp dpt:631
DROP       tcp  --  anywhere             anywhere           tcp dpt:http
DROP       tcp  --  anywhere             anywhere           tcp dpt:smtp
DROP       tcp  --  anywhere             anywhere           tcp dpt:ftp
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
ACCEPT     icmp --  anywhere             anywhere           icmp destination-unreachable
ACCEPT     icmp --  anywhere             anywhere           icmp redirect
ACCEPT     icmp --  anywhere             anywhere           icmp echo-request
ACCEPT     icmp --  anywhere             anywhere           icmp time-exceeded
DROP       icmp --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
ACCEPT     icmp --  anywhere             anywhere           icmp destination-unreachable
ACCEPT     icmp --  anywhere             anywhere           icmp redirect
ACCEPT     icmp --  anywhere             anywhere           icmp echo-request
ACCEPT     icmp --  anywhere             anywhere           icmp time-exceeded
ACCEPT     tcp  --  anywhere             192.168.0.2        tcp dpt:ssh

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

We have noticed that ssh isn't getting forwarded. What's wrong?

-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

