From: Jason Opperisano <opie@817west.com>
Subject: falling off custom chains [WAS Re: No Internet Connection]
Date: Fri, 10 Sep 2004 15:46:43 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094845603.1900.175.camel@wolfpack.ljm.dom>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

thought i would just go ahead and test this, to make sure i wasn't
batty.  for those of you not following the "No Internet Connection"
thread--the question was, if i set the default policy of a chain (like
OUTPUT) to DROP, and jump to a custom chain from that chain--what
happens to packets that reach the end of the custom chain?

answer:  they *do* continue traversing the calling chain where they left
off.  i set up this simple test to confirm:

- set the default policy of OUTPUT to drop
- jump to two custom chains in OUTPUT that only match TCP packets
- create OUTPUT rules after the custom chains that log & accept ICMP
packets
- ping the default gateway from this firewall

details of the test machine:

# uname -a
Linux vmg2 2.4.26-gentoo-r9 #2 Fri Sep 3 07:13:35 EDT 2004 i686 Intel(R)
Pentium(R) 4 CPU 2.20GHz GenuineIntel GNU/Linux

# iptables -V
iptables v1.2.11

------------------
-- SCRIPT BEGIN --
------------------
#!/bin/bash

# start clean
iptables -F
iptables -X
iptables -F -t nat
iptables -X -t nat
iptables -F -t mangle
iptables -X -t mangle

# set all policies to drop
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# custom chain--drop SYN-FIN Scans
iptables -N badstuff
iptables -A badstuff -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# custom chain--allow new, tcp SYN packets
iptables -N tcpstuff
iptables -A tcpstuff -p tcp --syn -m state --state NEW -j ACCEPT

# allow stateful replies in & log dropped packets
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "FW DROP IN: "

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j badstuff
iptables -A OUTPUT -j tcpstuff
iptables -A OUTPUT -p icmp -j LOG --log-prefix "FW OUT ICMP: "
iptables -A OUTPUT -p icmp -j ACCEPT
iptables -A OUTPUT -j LOG --log-prefix "FW DROP OUT: "
----------------
-- SCRIPT END --
----------------

i then pinged out from this firewall, which means we have to make it
through "badstuff" and "tcpstuff" in the OUTPUT chain before we get to
the pair of rules that log & allow ICMP packets out:

# ping -n -c1 172.30.30.2
PING 172.30.30.2 (172.30.30.2) 56(84) bytes of data.
64 bytes from 172.30.30.2: icmp_seq=1 ttl=128 time=0.548 ms

--- 172.30.30.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.548/0.548/0.548/0.000 ms

and the resulting log entry, confirming this:

Sep 10 19:39:26 vmg2 FW OUT ICMP: IN= OUT=eth0 SRC=172.30.30.12
DST=172.30.30.2 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=34341 SEQ=1

Hope this helps clear this up for anyone reading that thread (or
googling the archives in the future).

-j

-- 
Jason Opperisano <opie@817west.com>


